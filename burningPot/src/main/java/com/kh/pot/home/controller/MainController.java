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
	
	// 2. 추천 검색어(평점이 높은 순서 or 따봉이 많은 순서)의 레시피명을 불러오는 메소드
	
	// 3. 레시피(조회수가 많은 순서) 불러오는 메소드
	
	// 4. 평점(세부 레시피 정보에서) 불러오는 메소드
	
	// 5. 따봉 했을 때와 취소할 때 메소드
	
	// 6. Recipe 객체를 불러와서 Main.jsp에 레시피 명, 난이도, 소요시간, 작성자 불러오는 메소드
	
	@RequestMapping("showHome.do")
	public String recipeObject(Model model){
		System.out.println("showHome");
		
		List<Recipe> list = mainService.selectShowHome();
		
		model.addAttribute("list", list);
		
		System.out.println("showHome list : "+list);
		return "main";
	}
	
	@ResponseBody
	@RequestMapping("recipeObject.do")
	public List recipeObject(Model model, @RequestParam int number){
		System.out.println("recipeObject");
		
		List<Recipe> list = mainService.selectRecipe(number);
		
		/*model.addAttribute("list", list);
		*/
		System.out.println("recipeObject list : "+list);
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
