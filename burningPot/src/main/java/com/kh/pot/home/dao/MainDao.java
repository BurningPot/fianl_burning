package com.kh.pot.home.dao;

import java.util.HashMap;
import java.util.List;

import com.kh.pot.recipe.model.vo.Recipe;

public interface MainDao {

	List<Recipe> selectRecipe(HashMap<String, Integer> map);

	List<Recipe> selectShowHome(HashMap<String, Integer> map);
	
	int selectCountAllRecipe();

	List<Recipe> searchRecipe(HashMap<String, Object> map);

	int searchTotalCount(String keyWord);

	List<Recipe> searchRecipeList(HashMap<String, Object> map);

	int searchTotalCountHome(String search);

	int inquiryTotalCount(String keyWord);

	List<Recipe> inquiryRecipeListBefore(HashMap<String, Object> map);

	List<Recipe> inquiryRecipeListAfter(HashMap<String, Object> map);

	List<Recipe> recipeTop5();

	List<Recipe> recommandRecipeListBefore(HashMap<String, Object> map);

	int recommandTotalCount(String keyWord);

	List<Recipe> recommandRecipeListAfter(HashMap<String, Object> map);

	List<Recipe> levelAndTimeRecipeListBefore(HashMap<String, Object> map);

	int levelAndTimeAfterTotalCount(String keyWord);

	List<Recipe> levelAndTimeRecipeListAfter(HashMap<String, Object> map);

	int updatePlusRecommend(int recipeRNum);

	int insertRecommend(HashMap<String, Integer> map);

	int updateMinusRecommend(int recipeRNum);

	int deleteRecommend(HashMap<String, Integer> map);
	
	
}
