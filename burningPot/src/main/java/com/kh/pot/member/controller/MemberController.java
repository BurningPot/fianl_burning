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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		
		String msg="";
		String loc="/";
		String msgTitle="로그인 실패";
		String success = "";
		
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginVO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginVO.getUserProfile(oauthToken);
	    
		model.addAttribute("result", apiResult);
		
		StringtoVo stv = new StringtoVo();
		
		// 결과 정보를 멤버 Vo로 변환
		Member m = stv.naverToVo(apiResult);
		
		// 아이디 중복 검사
		if(memberService.checkIdDuplicate(m.getmId()) == 0){
			if(memberService.checkEmailDuplicate(m.getEmail()) == 0){
				
				if(m.getmId()!=null && m.getmId()!="" 
						&& m.getGender()!=null && m.getGender()!=""
						&& m.getEmail()!=null && m.getEmail()!=""
						&& m.getmName()!=null && m.getmName()!=""
						&& m.getBirthDate() !=null){
					
					memberService.insertMember(m);
					m = memberService.selectMemberId(m.getmId());
				}else{
					model.addAttribute("member",m);
					return "/member/googleEnroll";
				}
			}else{
				m = memberService.selectMemberEmail(m.getEmail());
			}
		}
		msgTitle="로그인 성공";
		success="success";
		msg="환영합니다.!!"+m.getmName()+" 님";
		model.addAttribute("m",m);
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		model.addAttribute("success",success);
		model.addAttribute("msgTitle",msgTitle);
		
		return "/common/sweetAlert";
		
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
	  String msgTitle="로그인 실패";
	  String success = "";
	  
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
		  msgTitle="로그인 성공!";
		  msg="환영합니다.!!"+m.getmName()+" 님";
		  success="success";
		  model.addAttribute("m",m);
	  }
	  
	  model.addAttribute("msg",msg);
	  model.addAttribute("loc",loc);
	  model.addAttribute("success",success);
	  model.addAttribute("msgTitle",msgTitle);
	  
	  return "/common/sweetAlert";

	}
	
	// 구글 회원가입 
	@RequestMapping(value="member/memberEnrollGoogle.do", method=RequestMethod.POST)
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
		String msgTitle="로그인 실패";
		String success = "";
		
		if(result >0){
			member = memberService.selectMemberId(member.getmId());
			msgTitle="로그인 성공!";
			msg="환영합니다.!!"+member.getmName()+" 님";
			success="success";
			model.addAttribute("m",member);
		} else msg="회원가입에 실패하였습니다.";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		model.addAttribute("success",success);
		model.addAttribute("msgTitle",msgTitle);
		
		return "/common/sweetAlert";
	}
	
	//음성 세션 설정
	@ResponseBody
	@RequestMapping("/member/setSKey.do")
	public String setSKey(@RequestParam String key, HttpSession session){
		if(session != null){
			session.getAttribute("speechKey");
		}
		session.setAttribute("speechKey",key);
		return key;
	}
	
	
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
	@RequestMapping(value="/member/findMemberId.do", method = RequestMethod.POST)
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
	@RequestMapping(value = "/member/findPwd.do", method=RequestMethod.POST)
	public Map<String, Object> findMemberPwd(@RequestParam String pMId,
											 @RequestParam String pEmail,
											 @RequestParam String pBirth){
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
	@RequestMapping(value="/member/chkEmail.do", method=RequestMethod.POST)
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
	@RequestMapping(value="/member/chkReEmail.do", method=RequestMethod.POST)
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
	@RequestMapping(value="member/memberEnrollEnd.do", method=RequestMethod.POST)
	public String memberEnrollEnd( @RequestParam String birth,
			Member member, Model model) throws ParseException{
		// 회원 설정
		member.setmCategory("회원");
		
		/*날짜 변환*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd"); 
		Date date = sdf.parse(birth);
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		
		member.setBirthDate(sqlDate);
		
		/******* password 암호화 *******/
//		암호화 부분 주석 
		String rawPassword = member.getPassword();
		System.out.println("password 암호화 전 : "+rawPassword);
		member.setPassword(bcryptPasswordEncoder.encode(rawPassword));
		
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
	@RequestMapping(value="member/login.do", method=RequestMethod.POST)
	public String login(@RequestParam String userId,
						@RequestParam String password,
						Model model){
		Member m = memberService.selectMemberId(userId);
		
		String msgTitle="로그인 실패";
		String msg="";
		String loc="/";
		String success = "";
		if(m != null){
			// 암호화 주석
			if(bcryptPasswordEncoder.matches(password, m.getPassword())) {
			 //if(password.equals(m.getPassword())){
				msgTitle="로그인 성공!";
				msg="환영합니다.!!"+m.getmName()+" 님";
				success = "success";
				model.addAttribute("m",m);
				
			}else{
				msg="비밀번호가 틀립니다.";
			}
		}else{
			msg="존재하지 않는 회원입니다.";
		}
		model.addAttribute("msgTitle", msgTitle);
		model.addAttribute("msg",msg);
		model.addAttribute("success",success);
		model.addAttribute("loc",loc);
		
		return "common/sweetAlert";
	}
	
	@RequestMapping(value="member/memberLogout.do")
	public String memberLogout(SessionStatus status){

		// 세션 종료
		if (!status.isComplete()) {
			status.setComplete();
		}
		return "redirect:/";
	}

}
