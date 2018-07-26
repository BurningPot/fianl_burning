package com.kh.pot.home.service;

import java.util.List;

import com.kh.pot.recipe.model.vo.Recipe;

public interface MainService {

	List<Recipe> selectRecipe(int startNumber, int endNumber);

	List<Recipe> selectShowHome();

	int selectCountAllRecipe();

	List<Recipe> searchRecipe(String search);

	int searchTotalCount(String keyWord);

	List<Recipe> searchRecipeList(int searchStartCount, int searchEndCount, String keyWord);

	int searchTotalCountHome(String search);

	int inquiryTotalCount(String keyWord);

	List<Recipe> inquiryRecipeListBefore(String keyWord);

	List<Recipe> inquiryRecipeListAfter(String keyWord, int inquiryStartCount, int inquiryEndCount);

	List<Recipe> recipeTop5();
	
	

	
}
