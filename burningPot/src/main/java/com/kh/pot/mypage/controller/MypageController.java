package com.kh.pot.mypage.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.pot.member.model.vo.Member;
import com.kh.pot.mypage.model.service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	MypageService mypageService;
	
/*	@RequestMapping("mypage/myPage.do")
	public String myPage(){
		return "mypage/myPage";
	}*/
	
//	닉네임 중복 검사
	@ResponseBody
	@RequestMapping("/mypage/checkNicDup.do")
	public Map<String, Object> checkNicDuplate(@RequestParam String mName){
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean isUsable = mypageService.checkNameDuplate(mName) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		return map;
	}
	
	// 회원정보수정 실행
	    @ResponseBody
		@RequestMapping("mypage/mypageEnrollEnd.do")
		public int mypageEnrollEnd(@RequestParam String nic,  @RequestParam String email, @RequestParam String password, @RequestParam String mId, SessionStatus status){
	    	
	    	System.out.println(nic+", " +email+", "+ password+", "+ mId);
			int result = mypageService.mypageEnrollEnd(nic, email, password, mId);

				// 세션 종료
				if (!status.isComplete()) {
					status.setComplete();
				}
				
			return result;
		}
	
	@RequestMapping("/mypage/myPage.do")
	public String selectMyBoardList(
			//cPage로 받을꺼고 값이 없어도 받을수 있다 required(오버로딩처럼 쓸수있다) 값이 안들어왔을때 디폴트벨류로 1로 하겟다
			@RequestParam(value="cPage", required=false, defaultValue="1") 
			int cPage, Model model){
			int numPerPage = 5; //한 페이지당 10개씩 자른다 (한 페이지당 게시글 수)
			
			// 1. 현재 페이지 컨텐츠 리스트 받아오기
			List<Map<String, String>> list = mypageService.selectMyBoardList(cPage, numPerPage);
			
			// 2. 전체 게시글 수 구하기
			int totalContents = mypageService.selectMyBoardTotalContents();
			
			// 반환자료형이 모델이면 붇혀서 사용 가능
			model.addAttribute("list", list).addAttribute("numPerPage", numPerPage).addAttribute("totalContents", totalContents);
			
			return "mypage/myPage";
		
	}
	
	//게시글 삭제하기!
		@ResponseBody
		@RequestMapping("/mypage/myPage222222.do")
		public int deleteMyBoard(@RequestParam int bNum){
			int result = mypageService.deleteMyBoard(bNum);
			
			return result;

		}
		
		@RequestMapping("/mypage/myPosts.do")
		public String myPosts(//cPage로 받을꺼고 값이 없어도 받을수 있다 required(오버로딩처럼 쓸수있다) 값이 안들어왔을때 디폴트벨류로 1로 하겟다
				@RequestParam(value="cPage", required=false, defaultValue="1") 
				int cPage, Model model){
				int numPerPage = 5; //한 페이지당 10개씩 자른다 (한 페이지당 게시글 수)
				
				// 1. 현재 페이지 컨텐츠 리스트 받아오기
				List<Map<String, String>> list = mypageService.selectMyBoardList(cPage, numPerPage);
				
				// 2. 전체 게시글 수 구하기
				int totalContents = mypageService.selectMyBoardTotalContents();
				
				// 반환자료형이 모델이면 붇혀서 사용 가능
				model.addAttribute("list", list).addAttribute("numPerPage", numPerPage).addAttribute("totalContents", totalContents);
			return "mypage/myPosts";
		}
		@RequestMapping("/mypage/myLike.do")
		public String myLike(
				//cPage로 받을꺼고 값이 없어도 받을수 있다 required(오버로딩처럼 쓸수있다) 값이 안들어왔을때 디폴트벨류로 1로 하겟다
				@RequestParam(value="cPage", required=false, defaultValue="1") 
				int cPage, Model model){
				int numPerPage = 5; //한 페이지당 10개씩 자른다 (한 페이지당 게시글 수)
				
				// 1. 현재 페이지 컨텐츠 리스트 받아오기
				List<Map<String, String>> list = mypageService.selectMyBoardList(cPage, numPerPage);
				
				// 2. 전체 게시글 수 구하기
				int totalContents = mypageService.selectMyBoardTotalContents();
				
				// 반환자료형이 모델이면 붇혀서 사용 가능
				model.addAttribute("list", list).addAttribute("numPerPage", numPerPage).addAttribute("totalContents", totalContents);
			return "mypage/myLike";
		}
		
		
	

	}
	


