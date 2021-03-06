package com.kh.pot.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.pot.board.model.vo.Board;
import com.kh.pot.common.exception.PotException;
import com.kh.pot.fridge.model.service.FridgeService;
import com.kh.pot.fridge.model.vo.Fridge;
import com.kh.pot.home.service.MainService;
import com.kh.pot.member.model.vo.Member;
import com.kh.pot.mypage.model.service.MypageService;
import com.kh.pot.recipe.model.vo.Recipe;

//m을 세션에 넣음
@SessionAttributes(value={"m"})

@Controller
public class MypageController {
	
	@Autowired
	MypageService mypageService;
	
	@Autowired
	MainService mainService;
	
	@Autowired
	FridgeService friService;
	
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
/*
				// 세션 종료
				if (!status.isComplete()) {
					status.setComplete();
				}
				*/
			return result;
		}
	
/*	@RequestMapping("/mypage/myPage2.do")
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
		
	}*/
	
	//레시피 게시글 삭제하기!
		@ResponseBody
		@RequestMapping(value="/mypage/myPagedelete.do", method=RequestMethod.POST)
		public int deleteMyRecipe(@RequestParam int rNum){
			int result = mypageService.deleteMyRecipe(rNum);
			
			return result;

		}
		
		// 내가쓴글 삭제하기
		@ResponseBody
		@RequestMapping(value="/mypage/myPostdelete.do", method=RequestMethod.POST)
		public int deleteMyPost(@RequestParam int bNum){
			int result = mypageService.deleteMyPost(bNum);
			
			return result;
		}

		// 좋아요 취소
		@ResponseBody
		@RequestMapping(value="/mypage/myLikedelete.do", method=RequestMethod.POST)
		public int cancelMyLike(@RequestParam int rNum, @RequestParam int mNum){
			int result = mypageService.cancelMyLike(rNum, mNum);
			return result;
		}
		
		@RequestMapping(value="/mypage/myPage.do",  method=RequestMethod.GET)
		/*public String myRecipe(@RequestParam int mNum , Model model,*/
		public String myRecipe( 
				Model model,
				@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
				HttpSession session) throws PotException{
			try{
			/*Member m =  mypageService.myinfoDel(mNum);*/
			Member m = (Member)session.getAttribute("m"); 
			int mNum = m.getmNum();
			m = mypageService.myinfoDel(mNum);
			int numPerPage = 5; //한 페이지당 10개씩 자른다 (한 페이지당 게시글 수)
			
			List<Recipe> list = mypageService.myRecipeList(cPage, numPerPage, mNum);
			int totalContents = mypageService.selectMyRecipeTotalContents(mNum);			
			List<Fridge> refList = friService.checkFridge(mNum);
			
			
			model.addAttribute("refList", refList);		
			model.addAttribute("recipeList", list).addAttribute("numPerPage", numPerPage).addAttribute("totalContents", totalContents);
			model.addAttribute("minfo", m);
			}catch(Exception e){
				throw new PotException( "마이페이지에러!","회원정보를 불러오는데 실패했습니다!");
			}
			return "mypage/myPage";
		}
		
		/*@ResponseBody*/
		@RequestMapping(value="/mypage/myPosts.do", method=RequestMethod.GET)
		public String myPostList( Model model,
				@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
				@RequestParam(value="cate", required=false, defaultValue="전체") String cate,
				HttpSession session) throws PotException{	
					try{
			Member m = (Member)session.getAttribute("m"); 
			int mNum = m.getmNum();
			m = mypageService.myinfoDel(mNum);
			
			int numPerPage = 5; //한 페이지당 10개씩 자른다 (한 페이지당 게시글 수)
			List<Board> list = mypageService.myPostList(cPage, numPerPage, mNum, cate);
			int totalContents = mypageService.selectMyPostTotalContents(mNum , cate);
			
			
			List<Fridge> refList = friService.checkFridge(m.getmNum());
			
			model.addAttribute("refList", refList);				
			model.addAttribute("postList", list).addAttribute("numPerPage", numPerPage).addAttribute("totalContents", totalContents);
			model.addAttribute("minfo", m);
					}catch(Exception e){
						throw new PotException( "마이페이지에러!","회원정보를 불러오는데 실패했습니다!");
					}
			
			
			return "mypage/myPosts";
		}
		

		@RequestMapping(value="/mypage/myLike.do", method=RequestMethod.GET)
		public String myLikeList(  Model model,
				//cPage로 받을꺼고 값이 없어도 받을수 있다 required(오버로딩처럼 쓸수있다) 값이 안들어왔을때 디폴트벨류로 1로 하겟다
				@RequestParam(value="cPage", required=false, defaultValue="1") 
				int cPage,
				HttpSession session){
			try{
			Member m = (Member)session.getAttribute("m"); 
			int mNum = m.getmNum();
			m = mypageService.myinfoDel(mNum);
				int numPerPage = 5; //한 페이지당 10개씩 자른다 (한 페이지당 게시글 수)
				
				List<Recipe> list = mypageService.myLikeList(cPage, numPerPage, mNum);
				
				int totalContents = mypageService.selectMyLikeTotalContents(mNum);
				
				List<Fridge> refList = friService.checkFridge(m.getmNum());
				
				model.addAttribute("refList", refList);				
				model.addAttribute("likeList", list).addAttribute("numPerPage", numPerPage).addAttribute("totalContents", totalContents);
				model.addAttribute("minfo", m);
				
			}catch(Exception e){
				throw new PotException( "마이페이지에러!","회원정보를 불러오는데 실패했습니다!");
			}
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
			Member m = (Member)request.getSession().getAttribute("m");
			m.setmPicture(renameFileName);
			
			request.getSession().setAttribute("m", m);
			
			return result;
		}
		
		@RequestMapping("mypage/deleteUserInfo.do")
		public String deleteUserInfo(@RequestParam int formDel, Model model, SessionStatus status){
			int result = mypageService.deleteUserInfo(formDel);
			
				// 세션 종료
		     status.setComplete();
		     
			return "redirect:/";
		}

	}
	


