package com.kh.pot.home.dao;

import java.util.HashMap;
import java.util.List;

import com.kh.pot.recipe.model.vo.Recipe;

public interface MainDao {

	List<Recipe> selectRecipe(HashMap<String, Integer> map);

	List<Recipe> selectShowHome();
	
	int selectCountAllRecipe();

}
