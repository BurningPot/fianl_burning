package com.kh.pot.recipe.model.service;

import java.util.List;
import java.util.Map;

import com.kh.pot.ingredient.model.vo.Ingredient;

public interface RecipeService {

	// 레시피 등록 페이지 접속 시 주재료 카테고리 조회 서비스
	List<Ingredient> selectCategoryList();

	// 카테로기 선택 시 관련 식재료 조회 서비스
	List<Ingredient> selectIngredientList(String category);
	
}