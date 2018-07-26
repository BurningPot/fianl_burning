package com.kh.pot.login.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.pot.member.model.vo.NaverLoginVO;

@Controller
public class LoginController {

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
	
//	네이버 로그인 url 생성
	@RequestMapping(value = {"naverLog.do", "login/naverLog.do"})
	public String naverLog(Model model, HttpSession session){
	
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginVO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginVO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		
		//네이버 
		model.addAttribute("url", naverAuthUrl);
		
		return "login/returnURL";
	}
	
	// 구글로그인 url 생성
	@RequestMapping(value = {"googleLogin.do", "login/googleLogin.do"})
	public String doGoogleSignInActionPage(HttpServletResponse response, Model model) throws Exception{
	  OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
	  String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
	  System.out.println("url : " + url);
	  model.addAttribute("url",url);
	  
	  return "login/returnURL";

	}
	
	
}
