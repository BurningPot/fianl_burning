package com.kh.pot.home.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.pot.board.model.service.BoardService;
import com.kh.pot.common.exception.PotException;
import com.kh.pot.fridge.model.service.FridgeService;
import com.kh.pot.home.service.MainService;
import com.kh.pot.ingredient.model.service.IngredientService;
import com.kh.pot.member.model.service.MemberService;
import com.kh.pot.member.model.vo.Member;
import com.kh.pot.mypage.model.service.MypageService;
import com.kh.pot.recipe.model.service.RecipeService;
import com.kh.pot.recipe.model.vo.Recipe;

@Controller
public class MainController {

	@Autowired
	BoardService boardService; 
	
	@Autowired
	FridgeService fridgeService;
	
	@Autowired
	IngredientService ingredientService;
	
	@Autowired
	MemberService memberSerivce;
	
	@Autowired
	MypageService myPageService;
	
	@Autowired
	RecipeService recipeSerivce;
	
	@Autowired
	MainService mainService;
	
	// 1. 검색(검색어에 레시피 명, 재료명이 있을 경우 레시피 전체를 보여줘야 하는) 메소드
	@RequestMapping("/home/searchRecipe.do")
	public String searchRecipe(@RequestParam("searchR") String search, HttpSession session, Model model) throws PotException{
		
		String originsearchWord = "";
		
		try {
			
			originsearchWord = search;
			
			search = search.replaceAll("\\s", ""); 
			
			System.out.println("search : " + search);
			System.out.println("originsearchWord : " + originsearchWord);
			
			Member m = (Member)session.getAttribute("m");
			
			int mNum = 0;
		
			if(m != null){
				mNum = m.getmNum();
			}
			
			List<Recipe> searchRecipeList = mainService.searchRecipe(search, mNum);
			
			int searchTotalCount = mainService.searchTotalCountHome(search);
	
			model.addAttribute("searchRecipeList", searchRecipeList);
			model.addAttribute("searchTotalCount", searchTotalCount);
			model.addAttribute("searchRecipeWord", originsearchWord);
			
		} catch (Exception e) {
			
			throw new PotException("검색 오류!", "검색을 하는 도중 에러가 발생했습니다");
		
		}
		return "common/searchRecipe";
	}
	
	// 검색 이후의 무한스크롤 적용
	@ResponseBody
	@RequestMapping("/home/searchRecipeObject.do")
	public List<Recipe> searchRecipeObject(Model model, 
											@RequestParam("number") int number, 
											HttpSession session, 
											@RequestParam("keyWord") String keyWord) throws PotException{
		
		
		List<Recipe> searchList = null;
		
		try {
			Member m = (Member)session.getAttribute("m");
			
			int mNum = 0;
			
			System.out.println("현재 로그인한 사람의 정보"+m);
			//System.out.println("사람의 번호"+ m.getmNum());
			
			if(m != null){
				mNum = m.getmNum();
			}

			// 레시피의 총 개수를 구한다.
			int searchTotalCount = mainService.searchTotalCount(keyWord);
			
			model.addAttribute("searchTotalCount", searchTotalCount);

			// 초기값과 최종값을 받아온다.
			int searchStartCount = number;
			int searchEndCount = number + 8;
		
			// 최종값의 경우 레시피의 개수보다 커질경우 레시피의 개수로 제한한다.
			if(searchEndCount >= searchTotalCount){
				searchEndCount = searchTotalCount;
			}
		
			// 시작값과 최종값을 list에 담아 쿼리문으로 보낸다.
			searchList = mainService.searchRecipeList(searchStartCount, searchEndCount, keyWord, mNum);

		} catch (Exception e) {
					
			throw new PotException("검색 오류!", "검색을 하는 도중 에러가 발생했습니다");
		
		}
		
		return searchList;
		
	}
	
	// 검색한 결과의 총 개수를 구하는 메소드
	
	// 2. 추천 검색어(평점이 높은 순서 or 따봉이 많은 순서)의 레시피명을 불러오는 메소드
	@ResponseBody
	@RequestMapping("/home/recipeTop.do")
	public List<Recipe> recipeTop5(Model model) throws PotException{
		
		List<Recipe> top5List = null;
		
		try {
			top5List = mainService.recipeTop5();
			
			model.addAttribute("top5List", top5List);
		} catch (Exception e) {
				
				throw new PotException("추천 검색어 오류!", "추천 검색어를 불러오는 도중 에러가 발생했습니다");
			
			}
		return top5List;
	}
	
	// 3. 레시피(조회수가 많은 순서) 불러오는 메소드
	@ResponseBody
	@RequestMapping("/home/inquiryBefore.do")
	public List<Recipe> inquiryBefore(Model model, 
									  @RequestParam("keyWord") String keyWord,
									  @RequestParam("TrueAndFalse") boolean TrueAndFalse,
									  @RequestParam("AscAndDesc") String AscAndDesc,
									  HttpSession session) throws PotException{
		
		List<Recipe> inquiryRecipeListBefore = null;
		
		try {
			Member m = (Member)session.getAttribute("m");
			
			int mNum = 0;
			
			if(m != null){
				mNum = m.getmNum();
			}
	
			
			
			if(TrueAndFalse == true){
				
				inquiryRecipeListBefore = mainService.inquiryRecipeListBefore(keyWord, AscAndDesc, mNum);
				
			} else {
				
				inquiryRecipeListBefore = mainService.inquiryRecipeListBefore(keyWord, AscAndDesc, mNum);

			}
		} catch (Exception e) {
			
			throw new PotException("조회 정렬 오류!", "조회 순으로 정렬 도중 에러가 발생했습니다");
		
		}
		
		return inquiryRecipeListBefore;
	}
	
	@ResponseBody
	@RequestMapping("/home/inquiryAfter.do")
	public List<Recipe> inquiryAfter(Model model, 
									 @RequestParam("keyWord") String keyWord, 
									 @RequestParam("number") int number,
									 @RequestParam("TrueAndFalse") boolean TrueAndFalse,
									 @RequestParam("AscAndDesc") String AscAndDesc,
									 HttpSession session) throws PotException{
		
		List<Recipe> inquiryRecipeListAfter = null;
		
		try {
			Member m = (Member)session.getAttribute("m");
			
			int mNum = 0;

			if(m != null){
				mNum = m.getmNum();
			}
			
			int inquiryTotalCount = mainService.inquiryTotalCount(keyWord);		
			
			int inquiryStartCount = number;
			int inquiryEndCount = number + 8;

			if(inquiryEndCount >= inquiryTotalCount){
				inquiryEndCount = inquiryTotalCount;
			}
			
			model.addAttribute("inquiryEndCount", inquiryEndCount);
			
			if(TrueAndFalse == false){
				
				AscAndDesc = "DESC"; // 강제로 바꿔줬음
				
				inquiryRecipeListAfter = mainService.inquiryRecipeListAfter(keyWord, inquiryStartCount, inquiryEndCount, AscAndDesc, mNum);
			
			} else {
				
				AscAndDesc = "ASC"; // 강제로 바꿔줬음
				
				inquiryRecipeListAfter = mainService.inquiryRecipeListAfter(keyWord, inquiryStartCount, inquiryEndCount, AscAndDesc, mNum);
				
			}
		} catch (Exception e) {
			
			throw new PotException("조회 정렬 오류!", "조회 순으로 정렬 도중 에러가 발생했습니다");
		
		}
			
		return inquiryRecipeListAfter;
	}
	
	// 3-1. 추천수로 정렬하는 메소드
	@ResponseBody
	@RequestMapping("/home/recommandBefore.do")
	public List<Recipe> recommandBefore(Model model, 
										  @RequestParam("keyWord") String keyWord,
										  @RequestParam("TrueAndFalse") boolean TrueAndFalse,
										  @RequestParam("AscAndDesc") String AscAndDesc,
										  HttpSession session) throws PotException{
		
		List<Recipe> recommandRecipeListBefore = null;
		
		try {
			Member m = (Member)session.getAttribute("m");
			
			int mNum = 0;
				
			if(m != null){
				mNum = m.getmNum();
			}

			
			
			if(TrueAndFalse == true){
				
				recommandRecipeListBefore = mainService.recommandRecipeListBefore(keyWord, AscAndDesc, mNum);
				
			} else {
				
				recommandRecipeListBefore = mainService.recommandRecipeListBefore(keyWord, AscAndDesc, mNum);
	
			}
		} catch (Exception e) {
			
			throw new PotException("추천 정렬 오류!", "추천 순으로 정렬하는 도중 에러가 발생했습니다");
		
		}
		
		return recommandRecipeListBefore;
		
	}
	
	@ResponseBody
	@RequestMapping("/home/recommandAfter.do")
	public List<Recipe> recommandAfter(Model model,
										@RequestParam("keyWord") String keyWord, 
										@RequestParam("number") int number,
										@RequestParam("TrueAndFalse") boolean TrueAndFalse,
										@RequestParam("AscAndDesc") String AscAndDesc,
										HttpSession session) throws PotException{
		
		List<Recipe> recommandRecipeListAfter = null;
		
		try {
			Member m = (Member)session.getAttribute("m");
			
			int mNum = 0;
			
			if(m != null){
				mNum = m.getmNum();
			}
			
			int recommandTotalCount = mainService.recommandTotalCount(keyWord);		
			
			int recommandStartCount = number;
			int recommandEndCount = number + 8;
		
			if(recommandEndCount >= recommandTotalCount){
				recommandEndCount = recommandTotalCount;
			}
			
			model.addAttribute("recommandEndCount", recommandEndCount);
			
			if(TrueAndFalse == false){
				
				AscAndDesc = "DESC"; // 강제로 바꿔줬음
				
				recommandRecipeListAfter = mainService.recommandRecipeListAfter(keyWord, recommandStartCount, recommandEndCount, AscAndDesc, mNum);
			
			} else {
				
				AscAndDesc = "ASC"; // 강제로 바꿔줬음
				
				recommandRecipeListAfter = mainService.recommandRecipeListAfter(keyWord, recommandStartCount, recommandEndCount, AscAndDesc, mNum);
				
			}
		} catch (Exception e) {
			
			throw new PotException("추천 정렬 오류!", "추천 순으로 정렬하는 도중 에러가 발생했습니다");
		
		}
	
		return recommandRecipeListAfter;
	}
	
	// 3-2. 난이도 및 시간으로 정렬하는 메소드
	@ResponseBody
	@RequestMapping("/home/levelAndTimeBefore.do")
	public List<Recipe> levelAndTimeBefore(Model model, 
											@RequestParam("keyWord") String keyWord,
											@RequestParam("TrueAndFalse") boolean TrueAndFalse,
											@RequestParam("AscAndDesc") String AscAndDesc,
											HttpSession session) throws PotException{
		
		List<Recipe> levelAndTimeRecipeListBefore = null;
		
		try {
			Member m = (Member)session.getAttribute("m");
			
			int mNum = 0;
			
			if(m != null){
				mNum = m.getmNum();
			}
			
			if(TrueAndFalse == true){
				
				levelAndTimeRecipeListBefore = mainService.levelAndTimeRecipeListBefore(keyWord, AscAndDesc, mNum);
			
			} else {
				
				levelAndTimeRecipeListBefore = mainService.levelAndTimeRecipeListBefore(keyWord, AscAndDesc, mNum);
	
			}
		} catch (Exception e) {
			
			throw new PotException("난이도 정렬 오류!", "난이도로 정렬하는 도중 에러가 발생했습니다");
		
		}
		
		return levelAndTimeRecipeListBefore;
	}
	
	@ResponseBody
	@RequestMapping("/home/levelAndTimeAfter.do")
	public List<Recipe> levelAndTimeAfter(Model model,
											@RequestParam("keyWord") String keyWord, 
											@RequestParam("number") int number,
											@RequestParam("TrueAndFalse") boolean TrueAndFalse,
											@RequestParam("AscAndDesc") String AscAndDesc,
											HttpSession session) throws PotException{
		
		List<Recipe> levelAndTimeRecipeListAfter = null;
		
		try {
			Member m = (Member)session.getAttribute("m");
			
			int mNum = 0;
			
			if(m != null){
				mNum = m.getmNum();
			}
		
			int levelAndTimeTotalCount = mainService.levelAndTimeAfterTotalCount(keyWord);		
			
			int levelAndTimeStartCount = number;
			int levelAndTimeEndCount = number + 8;
			
			if(levelAndTimeEndCount >= levelAndTimeTotalCount){
				levelAndTimeEndCount = levelAndTimeTotalCount;
			}
			
			model.addAttribute("levelAndTimeEndCount", levelAndTimeEndCount);
			
			if(TrueAndFalse == false){
				
				AscAndDesc = "DESC"; // 강제로 바꿔줬음
				
				levelAndTimeRecipeListAfter = mainService.levelAndTimeRecipeListAfter(keyWord, levelAndTimeStartCount, levelAndTimeEndCount, AscAndDesc, mNum);
			
			} else {
				
				AscAndDesc = "ASC"; // 강제로 바꿔줬음
				
				levelAndTimeRecipeListAfter = mainService.levelAndTimeRecipeListAfter(keyWord, levelAndTimeStartCount, levelAndTimeEndCount, AscAndDesc, mNum);
				
			}
		} catch (Exception e) {
			
			throw new PotException("난이도 정렬 오류!", "난이도로 정렬하는 도중 에러가 발생했습니다");
		
		}
		
		return levelAndTimeRecipeListAfter;
	}
	
	
	// 4. 평점(세부 레시피 정보에서) 불러오는 메소드
	
	// 5-1. 따봉 했을 때메소드
	@ResponseBody
	@RequestMapping("/home/likeBtnCheck.do")
	public boolean likeBtnCheck(Model model, 
							@RequestParam("mNum") int mNum, 
							@RequestParam("recipeRNum") int recipeRNum, 
							@RequestParam("recipeRRecommend") int recipeRRecommend) throws PotException{
		
		boolean TaF;
		try { 
			TaF = false;
		
			int updateRecommend = mainService.updatePlusRecommend(recipeRNum);
			
			if(updateRecommend == 1) {
				System.out.println(recipeRNum + "번 레시피의 추천수가 +1 되었습니다.");
				
				int insertRecommend = mainService.insertRecommend(mNum, recipeRNum);
				
				if(insertRecommend == 1){
					System.out.println("Recommend Table에 정상적으로 삽입되었습니다.");
					
					TaF = true;
					
				} else {
					System.out.println("Recommend Table에 정보 삽입이 실패하였습니다.");
				}
			}
		} catch (Exception e) {
			
			throw new PotException("좋아요 오류!", "좋아요 버튼 클릭 도중 에러가 발생했습니다");
		
		}
		
		return TaF;
	}
	
	// 5-2. likeBtn 취소
	@ResponseBody
	@RequestMapping("/home/likeBtnCancel.do")
	public boolean likeBtnCancel(Model model,
							@RequestParam("mNum") int mNum, 
							@RequestParam("recipeRNum") int recipeRNum, 
							@RequestParam("recipeRRecommend") int recipeRRecommend) throws PotException{
		
		boolean TaF;
		
		try {
			TaF = false;
			
			int updateRecommend = mainService.updateMinusRecommend(recipeRNum);
			
			if(updateRecommend == 1) {
				System.out.println(recipeRNum + "번 레시피의 추천수가 -1 되었습니다.");
				
				int insertRecommend = mainService.deleteRecommend(mNum, recipeRNum);
				
				if(insertRecommend == 1){
					System.out.println("Recommend Table에 정상적으로 삭제되었습니다.");
					
					TaF = true;
					
				} else {
					System.out.println("Recommend Table에 정보 삭제가 실패하였습니다.");
				}
			}
		} catch (Exception e) {
			
			throw new PotException("좋아요 오류!", "좋아요 버튼 클릭 도중 에러가 발생했습니다");
		
		}
		
		return TaF;
	}
	
	// 6. Recipe 객체를 불러와서 Main.jsp에 레시피 명, 난이도, 소요시간, 작성자 불러오는 메소드
	
	@RequestMapping(value = {"showHome.do", "home/showHome.do"})
	public String showHome(Model model, HttpSession session) throws PotException{
		
		try {
			Member m = (Member)session.getAttribute("m");
			
			int mNum = 0;
			
			if(m != null){
				mNum = m.getmNum();
			}
			
			int recipeCount = mainService.selectCountAllRecipe();
			
			List<Recipe> list = mainService.selectShowHome(mNum);
			
			model.addAttribute("list", list);
			model.addAttribute("recipeCount", recipeCount);
		
		} catch (Exception e) {
			
			throw new PotException("메인 페이지 오류!", "메인페이지에 레시피를 불러 오는 도중 에러가 발생했습니다");
		
		}
			
		return "main";
	}
	
	@ResponseBody
	@RequestMapping(value= {"recipeObject.do", "home/recipeObject.do"})
	public List<Recipe> recipeObject(Model model, 
										@RequestParam("number") int number,
										HttpSession session) throws PotException{
		
		List<Recipe> list = null;
		
		try {
			Member m = (Member)session.getAttribute("m");
			
			int mNum = 0;
			
			if(m != null){
				mNum = m.getmNum();
			}
			
			
			System.out.println("recipeObject");
			
			int recipeCount = mainService.selectCountAllRecipe();
			
			int startNumber = number;
			int endNumber = number+8;
			
			if(endNumber >= recipeCount){
				endNumber =recipeCount;
			}
			
			list = mainService.selectRecipe(startNumber, endNumber, mNum);
		
		} catch (Exception e) {
			
			throw new PotException("메인 페이지 오류!", "메인페이지에 레시피를 불러 오는 도중 에러가 발생했습니다");
		
		}
		return list;
	}
}
