package com.kh.pot.member.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.pot.common.emailHandler.MailHandler;
import com.kh.pot.common.emailHandler.TempKey;
import com.kh.pot.member.model.service.MemberService;
import com.kh.pot.member.model.vo.Member;

@SessionAttributes(value={"m"})
@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
/*	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	*/	
	@ResponseBody
	@RequestMapping("/member/deleteConfirmMail.do")
	public Map<String, Object> deleteMail(@RequestParam String emailAddr, SessionStatus status){
		
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isDelete = memberService.deleteMail(emailAddr) != 0 ? true : false;
		
		map.put("isDelete", isDelete);
		
		// 세션 종료
		if (!status.isComplete()) {
			status.setComplete();
		}
		
		return map;
	}
	
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll(){
		return "member/memberEnroll";
	}
	
	//	아이디 중복 검사
	@ResponseBody
	@RequestMapping("/member/checkIdDup.do")
	public Map<String, Object> checkIdDuplate(@RequestParam String mId){
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean isUsable = memberService.checkIdDuplicate(mId) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		return map;
	}
	
	//	이메일 중복 검사
	@ResponseBody
	@RequestMapping("/member/checkEmailDup.do")
	public Map<String, Object> checkEmailDuplate(@RequestParam String email){
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean isUsable = memberService.checkEmailDuplicate(email) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		return map;
	}
	
	@RequestMapping("/member/sendMailView.do")
	public String sendMailView(){
		return "member/sendMail";
	}
	
	//	이메일 중복 검사
	@ResponseBody
	@RequestMapping("/member/checkNameDup.do")
	public Map<String, Object> checkNameDuplate(@RequestParam String mName){
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean isUsable = memberService.checkNameDuplate(mName) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		return map;
	}
	
	// 이메일 인증
	@RequestMapping("/member/chkEmail.do")
	public String chkEmail(@RequestParam String chkEmail,
							Model model){
		System.out.println("chkEmail.do 실행");
		
		// ***** 이메일 인증키 생성, 이메일 발송 *****  
		try {
			memberService.regist(chkEmail);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("chkEmail",chkEmail);
		
		return "member/sendMail";
	}
	
	// 이메일 재전송
	@RequestMapping("/member/chkReEmail.do")
	public String chkReEmail(@RequestParam(value="confirmEmail", required=false) String confirmEmail,
							Model model){
		System.out.println("confirmEmail.do 실행");
		System.out.println("confirmEmail : "+confirmEmail);
		// ***** 이메일 인증키 생성, 이메일 발송 *****  
		try {
			memberService.regist(confirmEmail);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("chkEmail",confirmEmail);
		
		return "member/sendMail";
	}
	
	
	//이메일 인증 코드 검증
    @RequestMapping("/member/emailConfirm.do")
    public String emailConfirm(@RequestParam String userEmail,
								@RequestParam String memberAuthKey,
								Model model) throws Exception { 
        
        System.out.println("cont get user"+userEmail);
        System.out.println("cont get memberAuthKey"+memberAuthKey);
        
        String msg="";
        String loc="/";
        
        int result = memberService.userAuth(userEmail, memberAuthKey);
        System.out.println("컨트롤러userAuthresult:"+result);
        if(result > 0 ) {
        	msg = "메일 인증이 완료 되었습니다!! 나머지 회원가입을 진행해 주세요 ^^";
        }else{
        	msg = "비정상적인 접근 입니다. 다시 인증해 주세요";
        }
        model.addAttribute("msg",msg);
        model.addAttribute("loc",loc);
        
        return "common/msg";
    }
	
    // 메일 인증여부 확인
    @ResponseBody
    @RequestMapping("member/checkEmailConfirm.do")
    public Map<String, Object> checkEmailConfirm(@RequestParam String emailAddr){
		Map<String, Object> map = new HashMap<String, Object>();
		
		String isOk = memberService.checkEmailConfirm(emailAddr);
		System.out.println("is:"+isOk);
		map.put("isOk", isOk);
		
		return map;
	}

	// 회원가입 실행
	@RequestMapping("member/memberEnrollEnd.do")
	public String memberEnrollEnd( @RequestParam String birth,
			Member member, Model model) throws ParseException{

		member.setmCategory("회원");
		
		/*날짜 변환*/
		SimpleDateFormat sdf = new SimpleDateFormat("yy/mm/dd"); 
		Date date = sdf.parse(birth);
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		
		member.setBirthDate(sqlDate);
		
		System.out.println(member);

		// 회원 저장
		int result = memberService.insertMember(member);
		
		String msg = "";
		String loc = "/";
		
		if(result >0) msg="회원 가입에 성공하였습니다!";
		else msg="회원가입에 실패하였습니다.";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	// 로그인
	@RequestMapping("member/login.do")
	public String login(@RequestParam String userId,
						@RequestParam String password,
						Model model){
		Member m = memberService.selectMemberId(userId);
		
		System.out.println(userId);
		System.out.println(password);
		System.out.println(m);
		
		String msg="";
		String loc="/";
		
		if(m != null){
			if(password.equals(m.getPassword())){
				msg="환영합니다.!!"+m.getmName()+" 님";
				model.addAttribute("m",m);
			}else{
				msg="비밀번호가 틀립니다.";
			}
		}else{
			msg="존재하지 않는 회원입니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	@RequestMapping("member/memberLogout.do")
	public String memberLogout(SessionStatus status){

		// 세션 종료
		if (!status.isComplete()) {
			status.setComplete();
		}
		return "redirect:/";
	}

}
