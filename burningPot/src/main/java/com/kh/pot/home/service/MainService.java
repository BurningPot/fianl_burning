package com.kh.pot.home.service;

import java.util.List;

import com.kh.pot.recipe.model.vo.Recipe;

public interface MainService {

	List<Recipe> selectRecipe(int startNumber, int endNumber);

	List<Recipe> selectShowHome();

	int selectCountAllRecipe();

	List<Recipe> searchRecipe(String search, int mNum);

	int searchTotalCount(String keyWord);

	List<Recipe> searchRecipeList(int searchStartCount, int searchEndCount, String keyWord);

	int searchTotalCountHome(String search);

	int inquiryTotalCount(String keyWord);

	List<Recipe> inquiryRecipeListBefore(String keyWord, String AscAndDesc);

	List<Recipe> inquiryRecipeListAfter(String keyWord, int inquiryStartCount, int inquiryEndCount, String AscAndDesc);

	List<Recipe> recipeTop5();

	List<Recipe> recommandRecipeListBefore(String keyWord, String AscAndDesc);

	int recommandTotalCount(String keyWord);

	List<Recipe> recommandRecipeListAfter(String keyWord, int recommandStartCount, int recommandEndCount, String AscAndDesc);

	List<Recipe> levelAndTimeRecipeListBefore(String keyWord, String AscAndDesc);

	int levelAndTimeAfterTotalCount(String keyWord);

	List<Recipe> levelAndTimeRecipeListAfter(String keyWord, int levelAndTimeStartCount, int levelAndTimeEndCount, String AscAndDesc);

	int updateRecommend(int recipeRNum);

	int insertRecommend(int mNum, int recipeRNum);
	
	

	
}
