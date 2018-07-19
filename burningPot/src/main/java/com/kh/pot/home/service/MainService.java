package com.kh.pot.home.service;

import java.util.List;

import com.kh.pot.recipe.model.vo.Recipe;

public interface MainService {

	List<Recipe> selectRecipe(int number);

	List<Recipe> selectShowHome();

}
