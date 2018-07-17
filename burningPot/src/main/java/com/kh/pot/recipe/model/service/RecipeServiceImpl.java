package com.kh.pot.recipe.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.recipe.model.dao.RecipeDao;

@Service
public class RecipeServiceImpl implements RecipeService {
	
	@Autowired
	RecipeDao recipeDao;

	@Override
	public List<Ingredient> selectCategoryList() {
		
		return recipeDao.selectCategoryList();
		
	}

	@Override
	public List<Ingredient> selectIngredientList(String category) {

		return recipeDao.selectIngredientList(category);
		
	}

}