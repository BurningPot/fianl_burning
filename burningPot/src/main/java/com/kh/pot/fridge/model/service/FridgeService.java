package com.kh.pot.fridge.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.pot.fridge.model.vo.Fridge;
import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.recipe.model.vo.Recipe;

public interface FridgeService {

	List<Ingredient> checkCategory(String keyword, ArrayList<String> inRef);

	int updateComplete(String inRef, int mNum);
	
	List<Fridge> checkFridge(int mNum);

	List<Recipe> findRecipe(ArrayList<String> inRef);

	List<List<Ingredient>> bringName(List<String> data);

}
