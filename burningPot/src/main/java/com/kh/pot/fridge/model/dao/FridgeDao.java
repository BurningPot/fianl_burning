package com.kh.pot.fridge.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.pot.fridge.model.vo.Fridge;
import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.recipe.model.vo.Recipe;

public interface FridgeDao {

	List<Ingredient> checkCategory(Map<String, Object> data);

	List<Fridge> checkFridge(Map<String, Object> data);

	int insertFridge(Map<String, Object> data);

	int deleteFridge(Map<String, Object> data);

	List<Recipe> findRecipe(Map<String, Object> data);

	List<Ingredient> bringName(Map<String, String[]> data);

	List<Fridge> selectIngre(Map<String, Object> data);

}
