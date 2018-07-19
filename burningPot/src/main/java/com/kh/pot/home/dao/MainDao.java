package com.kh.pot.home.dao;

import java.util.List;

import com.kh.pot.recipe.model.vo.Recipe;

public interface MainDao {

	List<Recipe> selectRecipe(int number);

	List<Recipe> selectShowHome();

}
