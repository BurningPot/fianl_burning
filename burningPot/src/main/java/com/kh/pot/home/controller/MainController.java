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
	public String searchRecipe(@RequestParam("searchR") String search, HttpSession session, Model model){
		Member m = (Member)session.getAttribute("m");
		
		int mNum = 0;
		
		System.out.println("현재 로그인한 사람의 정보"+m);
		//System.out.println("사람의 번호"+ m.getmNum());
		
		if(m != null){
			mNum = m.getmNum();
		}
		
		List<Recipe> searchRecipeList = mainService.searchRecipe(search, mNum);
		System.out.println("검색 list : " + searchRecipeList);
		
		int searchTotalCount = mainService.searchTotalCountHome(search);

		
		
//		for( int i = 0; i < searchRecipeList.size(); i++){
//			model.addAttribute("searchRecipeListRNum", searchRecipeList.get(i).getmNum());
//			model.addAttribute("searchRecipeListMNum", searchRecipeList.get(i).getrNum());
//			
//			System.out.println("mNum : " + searchRecipeList.get(i).getmNum() + "rNum : " + searchRecipeList.get(i).getrNum());
//			
//		}
		
		model.addAttribute("searchRecipeList", searchRecipeList);
		model.addAttribute("searchTotalCount", searchTotalCount);
		model.addAttribute("searchRecipeWord", search);
		
		return "common/searchRecipe";
	}
	
	// 검색 이후의 무한스크롤 적용
	@ResponseBody
	@RequestMapping("/home/searchRecipeObject.do")
	public List<Recipe> searchRecipeObject(Model model, @RequestParam("number") int number, @RequestParam("keyWord") String keyWord){
		
		System.out.println("number : " + number);
		System.out.println("keyWord : " + keyWord);
		
		// 레시피의 총 개수를 구한다.
		int searchTotalCount = mainService.searchTotalCount(keyWord);
		
		model.addAttribute("searchTotalCount", searchTotalCount);
//		System.out.println("searchTotalCount : " + searchTotalCount);
		// 초기값과 최종값을 받아온다.
		int searchStartCount = number;
		int searchEndCount = number + 8;
		
		System.out.println("searchStartCount : " + searchStartCount);
		System.out.println("searchEndCount : " + searchEndCount);
		
		// 최종값의 경우 레시피의 개수보다 커질경우 레시피의 개수로 제한한다.
		if(searchEndCount >= searchTotalCount){
			searchEndCount = searchTotalCount;
			System.out.println("searchEndCount : " + searchEndCount);
		}
		System.out.println("searchEndCount : " + searchEndCount);
		
	
		// 시작값과 최종값을 list에 담아 쿼리문으로 보낸다.
			List<Recipe> searchList = mainService.searchRecipeList(searchStartCount, searchEndCount, keyWord);
			for(int i = 0; i< searchList.size();i++){
				System.out.println(searchList.get(i).getrName());
			}
		
		return searchList;
		
		
	}
	
	// 검색한 결과의 총 개수를 구하는 메소드
	
	// 2. 추천 검색어(평점이 높은 순서 or 따봉이 많은 순서)의 레시피명을 불러오는 메소드
	@ResponseBody
	@RequestMapping("/home/recipeTop.do")
	public List<Recipe> recipeTop5(Model model){
		
		List<Recipe> top5List = mainService.recipeTop5();
		
		model.addAttribute("top5List", top5List);
		
		return top5List;
	}
	
	// 3. 레시피(조회수가 많은 순서) 불러오는 메소드
	@ResponseBody
	@RequestMapping("/home/inquiryBefore.do")
	public List<Recipe> inquiryBefore(Model model, 
									  @RequestParam("keyWord") String keyWord,
									  @RequestParam("TrueAndFalse") boolean TrueAndFalse,
									  @RequestParam("AscAndDesc") String AscAndDesc){
		
		System.out.println("------------- 조회가 많은 순서대로 정렬하는 메소드 시작! ----------------");
		System.out.println("keyWord : " + keyWord);
		System.out.println("TrueAndFalse : " + TrueAndFalse);
		System.out.println("AscAndDesc : " + AscAndDesc);
		
		List<Recipe> inquiryRecipeListBefore;
		
		if(TrueAndFalse == true){
			
			inquiryRecipeListBefore = mainService.inquiryRecipeListBefore(keyWord, AscAndDesc);
			
//			TrueAndFalse = false;
//			AscAndDesc = "ASC";
			
			System.out.println("버튼 1번 클릭 시 TrueAndFalse : " + TrueAndFalse);
			System.out.println("버튼 1번 클릭 시 AscAndDesc : " + AscAndDesc);
		} else {
			
			inquiryRecipeListBefore = mainService.inquiryRecipeListBefore(keyWord, AscAndDesc);
			
//			TrueAndFalse = true;
//			AscAndDesc = "DESC";
			
			System.out.println("버튼 2번 클릭 시 TrueAndFalse : " + TrueAndFalse);
			System.out.println("버튼 2번 클릭 시 AscAndDesc : " + AscAndDesc);
		}
		for(int i = 0 ; i<inquiryRecipeListBefore.size(); i++){
			System.out.println("조회수 정렬 한 레시피 제목 : " + inquiryRecipeListBefore.get(i).getrName());
		}
		
		return inquiryRecipeListBefore;
	}
	
	@ResponseBody
	@RequestMapping("/home/inquiryAfter.do")
	public List<Recipe> inquiryAfter(Model model, 
									 @RequestParam("keyWord") String keyWord, 
									 @RequestParam("number") int number,
									 @RequestParam("TrueAndFalse") boolean TrueAndFalse,
									 @RequestParam("AscAndDesc") String AscAndDesc){
		
		System.out.println("------------- 조회가 많은 순서대로 정렬 후 무한스크롤 메소드 시작! ----------------");
		System.out.println("keyWord : " + keyWord);
		System.out.println("number : " + number);
		
		int inquiryTotalCount = mainService.inquiryTotalCount(keyWord);		
		
		System.out.println("inquiryTotalCount : " + inquiryTotalCount);
		
		int inquiryStartCount = number;
		int inquiryEndCount = number + 8;
		
		System.out.println("inquiryStartCount : " + inquiryStartCount);
		System.out.println("inquiryEndCount : " + inquiryEndCount);
		
		if(inquiryEndCount >= inquiryTotalCount){
			inquiryEndCount = inquiryTotalCount;
		}
		System.out.println("if문 이후의 inquiryEndCount : " + inquiryEndCount);
		
		model.addAttribute("inquiryEndCount", inquiryEndCount);
		
		List<Recipe> inquiryRecipeListAfter;
		
		if(TrueAndFalse == false){
			
			AscAndDesc = "DESC"; // 강제로 바꿔줬음
			
			inquiryRecipeListAfter = mainService.inquiryRecipeListAfter(keyWord, inquiryStartCount, inquiryEndCount, AscAndDesc);
		
		} else {
			
			AscAndDesc = "ASC"; // 강제로 바꿔줬음
			
			inquiryRecipeListAfter = mainService.inquiryRecipeListAfter(keyWord, inquiryStartCount, inquiryEndCount, AscAndDesc);
			
		}
		for(int i = 0 ; i<inquiryRecipeListAfter.size(); i++){
			System.out.println("조회수 정렬 후 무한 스크롤 레시피 제목 : " + inquiryRecipeListAfter.get(i).getrName());
		}
		
		System.out.println(inquiryRecipeListAfter.size());
		
		return inquiryRecipeListAfter;
	}
	
	// 3-1. 추천수로 정렬하는 메소드
	@ResponseBody
	@RequestMapping("/home/recommandBefore.do")
	public List<Recipe> recommandBefore(Model model, 
										  @RequestParam("keyWord") String keyWord,
										  @RequestParam("TrueAndFalse") boolean TrueAndFalse,
										  @RequestParam("AscAndDesc") String AscAndDesc){
		
		System.out.println("------------- 추천수가 많은 순서대로 정렬하는 메소드 시작! ----------------");
		System.out.println("keyWord : " + keyWord);
		System.out.println("TrueAndFalse : " + TrueAndFalse);
		System.out.println("AscAndDesc : " + AscAndDesc);
		
		List<Recipe> recommandRecipeListBefore;
		
		if(TrueAndFalse == true){
			
			recommandRecipeListBefore = mainService.recommandRecipeListBefore(keyWord, AscAndDesc);

			
			System.out.println("추천수 정렬 한 레시피 버튼 1번 클릭 시 TrueAndFalse : " + TrueAndFalse);
			System.out.println("추천수 정렬 한 레시피 버튼 1번 클릭 시 AscAndDesc : " + AscAndDesc);
		} else {
			recommandRecipeListBefore = mainService.recommandRecipeListBefore(keyWord, AscAndDesc);

			System.out.println("추천수 정렬 한 레시피 버튼 2번 클릭 시 TrueAndFalse : " + TrueAndFalse);
			System.out.println("추천수 정렬 한 레시피 버튼 2번 클릭 시 AscAndDesc : " + AscAndDesc);
		}
		for(int i = 0 ; i<recommandRecipeListBefore.size(); i++){
			System.out.println("추천수 정렬 한 레시피 제목 : " + recommandRecipeListBefore.get(i).getrName());
		}
		
		return recommandRecipeListBefore;
		
	}
	
	@ResponseBody
	@RequestMapping("/home/recommandAfter.do")
	public List<Recipe> recommandAfter(Model model,
										@RequestParam("keyWord") String keyWord, 
										@RequestParam("number") int number,
										@RequestParam("TrueAndFalse") boolean TrueAndFalse,
										@RequestParam("AscAndDesc") String AscAndDesc){
		
		System.out.println("------------- 추천수가 많은 순서대로 정렬 후 무한스크롤 메소드 시작! ----------------");
		System.out.println("keyWord : " + keyWord);
		System.out.println("number : " + number);
		
		int recommandTotalCount = mainService.recommandTotalCount(keyWord);		
		
		System.out.println("recommandTotalCount : " + recommandTotalCount);
		
		int recommandStartCount = number;
		int recommandEndCount = number + 8;
		
		System.out.println("recommandStartCount : " + recommandStartCount);
		System.out.println("recommandEndCount : " + recommandEndCount);
		
		if(recommandEndCount >= recommandTotalCount){
			recommandEndCount = recommandTotalCount;
		}
		System.out.println("if문 이후의 recommandEndCount : " + recommandEndCount);
		
		model.addAttribute("recommandEndCount", recommandEndCount);
		
		List<Recipe> recommandRecipeListAfter;
		
		if(TrueAndFalse == false){
			
			AscAndDesc = "DESC"; // 강제로 바꿔줬음
			
			recommandRecipeListAfter = mainService.recommandRecipeListAfter(keyWord, recommandStartCount, recommandEndCount, AscAndDesc);
		
		} else {
			
			AscAndDesc = "ASC"; // 강제로 바꿔줬음
			
			recommandRecipeListAfter = mainService.recommandRecipeListAfter(keyWord, recommandStartCount, recommandEndCount, AscAndDesc);
			
		}
		for(int i = 0 ; i<recommandRecipeListAfter.size(); i++){
			System.out.println("추천수 정렬 후 무한 스크롤 레시피 제목 : " + recommandRecipeListAfter.get(i).getrName());
		}
		
		System.out.println(recommandRecipeListAfter.size());
		
		return recommandRecipeListAfter;
	}
	
	// 3-2. 난이도 및 시간으로 정렬하는 메소드
	@ResponseBody
	@RequestMapping("/home/levelAndTimeBefore.do")
	public List<Recipe> levelAndTimeBefore(Model model, 
											@RequestParam("keyWord") String keyWord,
											@RequestParam("TrueAndFalse") boolean TrueAndFalse,
											@RequestParam("AscAndDesc") String AscAndDesc){
		
		System.out.println("------------- 난이도 및 시간이 많은 순서대로 정렬하는 메소드 시작! ----------------");
		System.out.println("keyWord : " + keyWord);
		System.out.println("TrueAndFalse : " + TrueAndFalse);
		System.out.println("AscAndDesc : " + AscAndDesc);
		
		List<Recipe> levelAndTimeRecipeListBefore;
		
		if(TrueAndFalse == true){
			
			levelAndTimeRecipeListBefore = mainService.levelAndTimeRecipeListBefore(keyWord, AscAndDesc);

			
			System.out.println("추천수 정렬 한 레시피 버튼 1번 클릭 시 TrueAndFalse : " + TrueAndFalse);
			System.out.println("추천수 정렬 한 레시피 버튼 1번 클릭 시 AscAndDesc : " + AscAndDesc);
		} else {
			levelAndTimeRecipeListBefore = mainService.levelAndTimeRecipeListBefore(keyWord, AscAndDesc);

			System.out.println("추천수 정렬 한 레시피 버튼 2번 클릭 시 TrueAndFalse : " + TrueAndFalse);
			System.out.println("추천수 정렬 한 레시피 버튼 2번 클릭 시 AscAndDesc : " + AscAndDesc);
		}
		for(int i = 0 ; i<levelAndTimeRecipeListBefore.size(); i++){
			System.out.println("추천수 정렬 한 레시피 제목 : " + levelAndTimeRecipeListBefore.get(i).getrName());
		}
		
		return levelAndTimeRecipeListBefore;
	}
	
	@ResponseBody
	@RequestMapping("/home/levelAndTimeAfter.do")
	public List<Recipe> levelAndTimeAfter(Model model,
											@RequestParam("keyWord") String keyWord, 
											@RequestParam("number") int number,
											@RequestParam("TrueAndFalse") boolean TrueAndFalse,
											@RequestParam("AscAndDesc") String AscAndDesc){
		
		System.out.println("------------- 난이도 및 시간이 많은 순서대로 정렬 후 무한스크롤 메소드 시작! ----------------");
		System.out.println("keyWord : " + keyWord);
		System.out.println("number : " + number);
		
		int levelAndTimeTotalCount = mainService.levelAndTimeAfterTotalCount(keyWord);		
		
		System.out.println("levelAndTimeAfterTotalCount : " + levelAndTimeTotalCount);
		
		int levelAndTimeStartCount = number;
		int levelAndTimeEndCount = number + 8;
		
		System.out.println("levelAndTimeStartCount : " + levelAndTimeStartCount);
		System.out.println("levelAndTimeEndCount : " + levelAndTimeEndCount);
		
		if(levelAndTimeEndCount >= levelAndTimeTotalCount){
			levelAndTimeEndCount = levelAndTimeTotalCount;
		}
		System.out.println("if문 이후의 levelAndTimeEndCount : " + levelAndTimeEndCount);
		
		model.addAttribute("levelAndTimeEndCount", levelAndTimeEndCount);
		
		List<Recipe> levelAndTimeRecipeListAfter;
		
		if(TrueAndFalse == false){
			
			AscAndDesc = "DESC"; // 강제로 바꿔줬음
			
			levelAndTimeRecipeListAfter = mainService.levelAndTimeRecipeListAfter(keyWord, levelAndTimeStartCount, levelAndTimeEndCount, AscAndDesc);
		
		} else {
			
			AscAndDesc = "ASC"; // 강제로 바꿔줬음
			
			levelAndTimeRecipeListAfter = mainService.levelAndTimeRecipeListAfter(keyWord, levelAndTimeStartCount, levelAndTimeEndCount, AscAndDesc);
			
		}
		for(int i = 0 ; i<levelAndTimeRecipeListAfter.size(); i++){
			System.out.println("추천수 정렬 후 무한 스크롤 레시피 제목 : " + levelAndTimeRecipeListAfter.get(i).getrName());
		}
		
		System.out.println(levelAndTimeRecipeListAfter.size());
		
		return levelAndTimeRecipeListAfter;
	}
	
	
	// 4. 평점(세부 레시피 정보에서) 불러오는 메소드
	
	// 5-1. 따봉 했을 때메소드
	@ResponseBody
	@RequestMapping("/home/likeBtnCheck.do")
	public boolean likeBtn(Model model, 
							@RequestParam("mNum") int mNum, 
							@RequestParam("recipeRNum") int recipeRNum, 
							@RequestParam("recipeRRecommend") int recipeRRecommend){
		 
		boolean TaF = false;
		
		System.out.println("Controller에서의 mId : " + mNum);
		System.out.println("Controller에서의 recipeRNum : " + recipeRNum);
		System.out.println("Controller에서의 recipeRRecommend : " + recipeRRecommend);
		
		int updateRecommend = mainService.updateRecommend(recipeRNum);
		
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
		
		return TaF;
	}
	
	// 5-2. likeBtn 취소
	
	// 6. Recipe 객체를 불러와서 Main.jsp에 레시피 명, 난이도, 소요시간, 작성자 불러오는 메소드
	
	@RequestMapping(value = {"showHome.do", "home/showHome.do"})
	public String showHome(Model model){
		System.out.println("showHome");
		
		int recipeCount = mainService.selectCountAllRecipe();
		
		List<Recipe> list = mainService.selectShowHome();
		
		model.addAttribute("list", list);
		model.addAttribute("recipeCount", recipeCount);
		
		System.out.println("showHome list : "+list);
		
		return "main";
	}
	
	@ResponseBody
	@RequestMapping(value= {"recipeObject.do", "home/recipeObject.do"})
	public List<Recipe> recipeObject(Model model, @RequestParam int number){
		System.out.println("recipeObject");
		
		int recipeCount = mainService.selectCountAllRecipe();
		
		int startNumber = number;
		int endNumber = number+8;
		
		if(endNumber >= recipeCount){
			endNumber =recipeCount;
		}
		System.out.println("startNumber: "+startNumber);
		System.out.println("endNumber: "+endNumber);
		
		List<Recipe> list = mainService.selectRecipe(startNumber, endNumber);
		
		//model.addAttribute("list", list);
		for(int i = 0; i< list.size();i++){
			System.out.println(list.get(i).getrName());
		}
		
		
		return list;
	}
}
