package com.kh.pot.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.pot.home.service.MainService;
import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.member.model.vo.Member;
import com.kh.pot.mypage.model.service.MypageService;
import com.kh.pot.recipe.model.vo.Recipe;

@Controller
public class MypageController {
	
	@Autowired
	MypageService mypageService;
	
	@Autowired
	MainService mainService;
	
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
		
		@ResponseBody
		@RequestMapping("/mypage/updateImg.do")
		public int updateImg(@RequestParam  MultipartFile[] profileBtn, HttpServletRequest request, @RequestParam String oriHidden, @RequestParam int numHidden){
			String saveDir = request.getSession().getServletContext().getRealPath("/resources/img/profile");
			File dir = new File(saveDir);
			
			int result = 0;
					
			// 만약 현재 저장하려는 경로에 폴더가 없다면 만들겠습니다!
			if(!dir.exists()){
				System.out.println("dir.mkdirs() = "+dir.mkdirs());
			}
			
			String renameFileName = "";
			if(profileBtn.length >0){
				if(!profileBtn[0].isEmpty()){
				String originFileName = profileBtn[0].getOriginalFilename(); // 원본파일 이름
				String ext = originFileName.substring(originFileName.lastIndexOf(".")+1); //확장자
				
				//이름을 새로 만들어서 변경해준다
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
				int randomNum = (int)(Math.random() * 1000);			
				renameFileName = sdf.format(new Date(System.currentTimeMillis()))+"_"+randomNum+"."+ext;
				
				//새로만든 이름으로 저장경로에 저장시킨다
				try {
					profileBtn[0].transferTo(new File(saveDir+"/"+renameFileName));
				} catch (IllegalStateException | IOException e) {					
					e.printStackTrace();
				}	
				 result = mypageService.updateImg(renameFileName,numHidden);
				
				//사진을 수정한 후에는 기존의 이미지는 삭제한다
				/*File file = new File(saveDir+"/"+oriHidden);		
				System.out.println("기존의 이미지 이름 : "+oriHidden);
				// 파일이 실제로 존재하는지 검사
				
				if( file.exists() ){
					System.out.println("파일 실존함");
					file.delete();
					System.out.println("기존의 "+oriHidden+"를 삭제하였다!");
				}*/	
			
			}
		}	
			
			return result;
		}
		
		@RequestMapping("mypage/deleteUserInfo.do")
		public String deleteUserInfo(@RequestParam int formDel, Model model){			
			int result = mypageService.deleteUserInfo(formDel);
			
			List<Recipe> list = mainService.selectShowHome();
			
			model.addAttribute("list", list);
			
			return "main";
		}

	}
	


