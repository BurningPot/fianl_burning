package com.kh.pot.member.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.pot.common.login.StringtoVo;
import com.kh.pot.member.model.service.MemberService;
import com.kh.pot.member.model.vo.Member;
import com.kh.pot.member.model.vo.NaverLoginVO;

@SessionAttributes(value={"m"})
@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	/* naverLoginVO */
	private NaverLoginVO naverLoginVO;
	private String apiResult = null;
	@Autowired
	private void setnaverLoginVO(NaverLoginVO naverLoginVO) {
		this.naverLoginVO = naverLoginVO;
	}
	
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;

	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginVO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginVO.getUserProfile(oauthToken);
	    
		model.addAttribute("result", apiResult);
		System.out.println("apiResult:"+apiResult);
		
		StringtoVo stv = new StringtoVo();
		
		// 결과 정보를 멤버 Vo로 변환
		Member m = stv.naverToVo(apiResult);
		
		// 아이디 중복 검사
		if(memberService.checkIdDuplicate(m.getmId()) == 0){
			memberService.insertMember(m);
		}
		
		m = memberService.selectMemberId(m.getmId());
		
		String msg="";
		String loc="/";
		
		msg="환영합니다.!!"+m.getmName()+" 님";
		model.addAttribute("m",m);
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "/common/msg";
	}
	
	//	구글 로그인 성공시 callback.do
	@RequestMapping(value = "/callbackg.do", method = RequestMethod.GET)
	public String doSessionAssignActionPage(HttpServletRequest request, Model model)throws Exception{
	  String code = request.getParameter("code");

	  OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
	  AccessGrant accessGrant = oauthOperations.exchangeForAccess(code , googleOAuth2Parameters.getRedirectUri(),
	      null);

	  String accessToken = accessGrant.getAccessToken();
	  Long expireTime = accessGrant.getExpireTime();
	  if (expireTime != null && expireTime < System.currentTimeMillis()) {
	    accessToken = accessGrant.getRefreshToken();
	    System.out.printf("accessToken is expired. refresh token = {}", accessToken);
	  }
	  Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
	  Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
	  
	  PlusOperations plusOperations = google.plusOperations();
	  Person profile = plusOperations.getGoogleProfile();
	  
	  String msg ="";
	  String loc="/";
	  System.out.println("callback 실행");
	  Member m = new Member();
	  
	  if(memberService.checkIdDuplicate(profile.getId()) == 0){
		  m.setmId(profile.getId());
		  m.setmName(profile.getFamilyName()+profile.getGivenName());
		  m.setmPicture(profile.getImageUrl());
		  m.setEmail(profile.getAccountEmail());
		  m.setPassword(accessToken);

		  java.sql.Date birthday = new java.sql.Date(profile.getBirthday().getTime());		  
		  m.setBirthDate(birthday);
		 
		  if(profile.getGender().equals("male")){
			  m.setGender("M");
		  }else if(profile.getGender().equals("female")){
			  m.setGender("F");
		  }

		  model.addAttribute("member", m);
		  
		  return "/member/googleEnroll";
	  }else{
		  m = memberService.selectMemberId(profile.getId());
		  msg="환영합니다.!!"+m.getmName()+" 님";
		  model.addAttribute("m",m);
	  }
	  
	  model.addAttribute("msg",msg);
	  model.addAttribute("loc",loc);
	  
	  return "/common/msg";

	}
	
	// 구글 회원가입 
	@RequestMapping("member/memberEnrollGoogle.do")
	public String memberEnrollGoogle( @RequestParam String birth,
			Member member, Model model) throws ParseException{

		member.setmCategory("회원");
		
		/*날짜 변환*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd"); 
		Date date = sdf.parse(birth);
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		
		member.setBirthDate(sqlDate);
		member.setPassword("GooleLogin");
		System.out.println("member="+member);
		// 구글 회원 저장
		int result = memberService.insertMember(member);
		
		String msg = "";
		String loc = "/";
		
		if(result >0){
			member = memberService.selectMemberId(member.getmId());
			msg="환영합니다.!!"+member.getmName()+" 님";
			model.addAttribute("m",member);
		} else msg="회원가입에 실패하였습니다.";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
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
	
	// 회원 가입창으로 이동
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
	
	// 아이디 찾기
	@ResponseBody
	@RequestMapping("/member/findMemberId.do")
	public Map<String, Object> findMemberId(@RequestParam String mEmail, @RequestParam String mBirth){
		Map<String, Object> map = new HashMap<String, Object>();
		String memberId = memberService.findMemberId(mEmail, mBirth);
		map.put("isMember", false);

		if(memberId != null){
			map.put("mId", memberId);
			map.put("isMember", true);
			
			try {
				memberService.findMember(mEmail, memberId, true);
			} catch (Exception e) {
				System.out.println("이메일 보내기 실패");
				e.printStackTrace();
			}
			
		}
			
		return map;
	}
	
	// 비밀번호 찾기 
	@ResponseBody
	@RequestMapping("/member/findPwd.do")
	public Map<String, Object> findMemberPwd(@RequestParam String pMId,
											 @RequestParam String pEmail,
											 @RequestParam String pBirth){
		System.out.println("aasdfasdf");
		Map<String, Object> map = new HashMap<String, Object>();
		
		Member isMember = memberService.findMemberPwd(pMId, pEmail, pBirth);
		
		System.out.println("isMember?"+isMember);
		
		if(isMember != null) {
			map.put("isMember", true);
			
			try{
				memberService.findMember(pEmail, pMId, false);
			}catch(Exception e){
				System.out.println("메일 보내기 실패");
				e.printStackTrace();
			}
		}
		else map.put("isMember", false);
		
		return map;
	}
	
	// 메일 전송 창으로 이동
	@RequestMapping("/member/sendMailView.do")
	public String sendMailView(){
		return "member/sendMail";
	}
	
	// 이메일 중복 검사
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

        String msg="";
        
        int result = memberService.userAuth(userEmail, memberAuthKey);

        if(result > 0 ) {
        	msg = "메일 인증이 완료 되었습니다!! 나머지 회원가입을 진행해 주세요 ^^";
        }else{
        	msg = "비정상적인 접근 입니다. 다시 인증해 주세요";
        }
        model.addAttribute("msg",msg);
       
        return "common/closeAlert";
    }
	
    // 메일 인증여부 확인
    @ResponseBody
    @RequestMapping("member/checkEmailConfirm.do")
    public Map<String, Object> checkEmailConfirm(@RequestParam String emailAddr){
		Map<String, Object> map = new HashMap<String, Object>();
		
		String isOk = memberService.checkEmailConfirm(emailAddr);

		map.put("isOk", isOk);
		
		return map;
	}

	// 회원가입 실행
	@RequestMapping("member/memberEnrollEnd.do")
	public String memberEnrollEnd( @RequestParam String birth,
			Member member, Model model) throws ParseException{

		member.setmCategory("회원");
		
		/*날짜 변환*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd"); 
		Date date = sdf.parse(birth);
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		
		member.setBirthDate(sqlDate);

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
