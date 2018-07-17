package com.kh.pot.recipe.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.pot.ingredient.model.vo.Ingredient;

public interface RecipeDao {
	
	List<Ingredient> selectCategoryList();

	List<Ingredient> selectIngredientList(String category);

}