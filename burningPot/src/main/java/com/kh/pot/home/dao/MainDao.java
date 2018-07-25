package com.kh.pot.home.dao;

import java.util.HashMap;
import java.util.List;

import com.kh.pot.recipe.model.vo.Recipe;

public interface MainDao {

	List<Recipe> selectRecipe(HashMap<String, Integer> map);

	List<Recipe> selectShowHome();
	
	int selectCountAllRecipe();

	List<Recipe> searchRecipe(String search);

	int searchTotalCount(String keyWord);

	List<Recipe> searchRecipeList(HashMap<String, Object> map);

	int searchTotalCountHome(String search);

	int inquiryTotalCount(String keyWord);

	List<Recipe> inquiryRecipeListBefore(String keyWord);

	List<Recipe> inquiryRecipeListAfter(HashMap<String, Object> map);

	


	
}
