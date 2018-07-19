package com.kh.pot.home.service;

import java.util.List;

import com.kh.pot.recipe.model.vo.Recipe;

public interface MainService {

	List<Recipe> selectRecipe(int startNumber, int endNumber);

	List<Recipe> selectShowHome();

	int selectCountAllRecipe();
}
