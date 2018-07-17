package com.kh.pot.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	
	@RequestMapping("mypage/myPage.do")
	public String myPage(){
		return "mypage/myPage";
	}
	

}
