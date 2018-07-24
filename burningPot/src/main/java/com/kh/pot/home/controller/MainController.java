package com.kh.pot.home.controller;

import java.util.List;

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
	public String searchRecipe(@RequestParam("searchR") String search, Model model){
		
		List<Recipe> searchRecipeList = mainService.searchRecipe(search);
		
		System.out.println("검색 list : " + searchRecipeList);
		
		int searchTotalCount = mainService.searchTotalCountHome(search);
		
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
			System.out.println("asdf");
			for(int i = 0; i< searchList.size();i++){
				System.out.println(searchList.get(i).getrName());
			}
		
		return searchList;
		
	}
	
	// 검색한 결과의 총 개수를 구하는 메소드
	
	// 2. 추천 검색어(평점이 높은 순서 or 따봉이 많은 순서)의 레시피명을 불러오는 메소드
	
	// 3. 레시피(조회수가 많은 순서) 불러오는 메소드
	
	// 4. 평점(세부 레시피 정보에서) 불러오는 메소드
	
	// 5. 따봉 했을 때와 취소할 때 메소드
	
	// 6. Recipe 객체를 불러와서 Main.jsp에 레시피 명, 난이도, 소요시간, 작성자 불러오는 메소드

	@RequestMapping(value = {"showHome.do", "home/showHome.do"})
	public String showHome(Model model){
		System.out.println("showHome");
		
		List<Recipe> list = mainService.selectShowHome();
		
		model.addAttribute("list", list);
		
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
