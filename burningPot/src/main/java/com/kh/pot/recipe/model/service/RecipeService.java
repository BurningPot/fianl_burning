package com.kh.pot.recipe.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.recipe.model.vo.Recipe;
import com.kh.pot.recipe.model.vo.RecipeContent;

public interface RecipeService {

	// 레시피 등록 페이지 접속 시 주재료 카테고리 조회 서비스
	List<Ingredient> selectCategoryList();

	// 카테고리 선택 시 관련 식재료 조회 서비스
	List<Ingredient> selectIngredientList(String category);

	// 레시피 등록 서비스
	int insertRecipe(Recipe recipe);

	// 레시피 내용 등록 서비스
	int insertRecipeContent(RecipeContent recipeContent);

	// 이미지 파일 명칭 변경 서비스
	String renameFile(MultipartFile file);

	// 레시피 상세보기 서비스
	Recipe selectRecipeDetail(int rNum);

	// 식재료 명칭 조회 서비스
	List<Ingredient> selectMainIngredientList(String[] mainName);

	// 해당 레시피 요리 순서 조회 서비스
	List<RecipeContent> selectContentList(int rNum);
	
}