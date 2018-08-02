package com.kh.pot.home.service;

import java.util.List;

import com.kh.pot.recipe.model.vo.Recipe;

public interface MainService {

	List<Recipe> selectRecipe(int startNumber, int endNumber, int mNum);

	List<Recipe> selectShowHome(int mNum);

	int selectCountAllRecipe();

	List<Recipe> searchRecipe(String search, int mNum);

	int searchTotalCount(String keyWord);

	List<Recipe> searchRecipeList(int searchStartCount, int searchEndCount, String keyWord, int mNum);

	int searchTotalCountHome(String search);

	int inquiryTotalCount(String keyWord);

	List<Recipe> inquiryRecipeListBefore(String keyWord, String AscAndDesc, int mNum);

	List<Recipe> inquiryRecipeListAfter(String keyWord, int inquiryStartCount, int inquiryEndCount, String AscAndDesc, int mNum);

	List<Recipe> recipeTop5();

	List<Recipe> recommandRecipeListBefore(String keyWord, String AscAndDesc, int mNum);

	int recommandTotalCount(String keyWord);

	List<Recipe> recommandRecipeListAfter(String keyWord, int recommandStartCount, int recommandEndCount, String AscAndDesc, int mNum);

	List<Recipe> levelAndTimeRecipeListBefore(String keyWord, String AscAndDesc, int mNum);

	int levelAndTimeAfterTotalCount(String keyWord);

	List<Recipe> levelAndTimeRecipeListAfter(String keyWord, int levelAndTimeStartCount, int levelAndTimeEndCount, String AscAndDesc, int mNum);

	int updatePlusRecommend(int recipeRNum);

	int insertRecommend(int mNum, int recipeRNum);

	int updateMinusRecommend(int recipeRNum);

	int deleteRecommend(int mNum, int recipeRNum);
	
	
	
}
