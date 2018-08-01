package com.kh.pot.home.dao;

import java.util.HashMap;
import java.util.List;

import com.kh.pot.recipe.model.vo.Recipe;

public interface MainDao {

	List<Recipe> selectRecipe(HashMap<String, Integer> map);

	List<Recipe> selectShowHome();
	
	int selectCountAllRecipe();

	List<Recipe> searchRecipe(HashMap<String, Object> map);

	int searchTotalCount(String keyWord);

	List<Recipe> searchRecipeList(HashMap<String, Object> map);

	int searchTotalCountHome(String search);

	int inquiryTotalCount(String keyWord);

	List<Recipe> inquiryRecipeListBefore(HashMap<String, String> map);

	List<Recipe> inquiryRecipeListAfter(HashMap<String, Object> map);

	List<Recipe> recipeTop5();

	List<Recipe> recommandRecipeListBefore(HashMap<String, String> map);

	int recommandTotalCount(String keyWord);

	List<Recipe> recommandRecipeListAfter(HashMap<String, Object> map);

	List<Recipe> levelAndTimeRecipeListBefore(HashMap<String, String> map);

	int levelAndTimeAfterTotalCount(String keyWord);

	List<Recipe> levelAndTimeRecipeListAfter(HashMap<String, Object> map);

	int updateRecommend(int recipeRNum);

	int insertRecommend(HashMap<String, Integer> map);
	
}
