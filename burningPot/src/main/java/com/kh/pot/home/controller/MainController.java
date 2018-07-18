package com.kh.pot.home.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.pot.board.model.service.BoardService;
import com.kh.pot.fridge.model.service.FridgeService;
import com.kh.pot.ingredient.model.service.IngredientService;
import com.kh.pot.member.model.service.MemberService;
import com.kh.pot.mypage.model.service.MypageService;
import com.kh.pot.recipe.model.service.RecipeService;

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
	
	// 1. 검색(검색어에 레시피 명, 재료명이 있을 경우 레시피 전체를 보여줘야 하는) 메소드
	
	// 2. 추천 검색어(평점이 높은 순서 or 따봉이 많은 순서)의 레시피명을 불러오는 메소드
	
	// 3. 레시피(조회수가 많은 순서) 불러오는 메소드
	
	// 4. 평점(세부 레시피 정보에서) 불러오는 메소드
	
	// 5. 따봉 했을 때와 취소할 때 메소드
}
