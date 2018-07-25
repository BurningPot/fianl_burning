package com.kh.pot.recipe.model.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.recipe.model.dao.RecipeDao;
import com.kh.pot.recipe.model.vo.Recipe;
import com.kh.pot.recipe.model.vo.RecipeContent;

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

	@Override
	public int insertRecipe(Recipe recipe) {

		return recipeDao.insertRecipe(recipe);
	}

	@Override
	public int insertRecipeContent(RecipeContent recipeContent) {

		return recipeDao.insertRecipeContent(recipeContent);
		
	}

	@Override
	public String renameFile(MultipartFile file) {

		return recipeDao.renameFile(file);
		
	}

	@Override
	public Recipe selectRecipeDetail(int rNum) {

		return recipeDao.selectRecipeDetail(rNum);
		
	}

	@Override
	public List<Ingredient> selectMainIngredientList(String[] mainName) {

		List<String> list = Arrays.asList(mainName);
		Map<String, List<String>> mainNameMap = new HashMap<String, List<String>>();
		
		mainNameMap.put("mainName", list);
		return recipeDao.selectMainIngredientList(mainNameMap);
		
	}

	@Override
	public List<RecipeContent> selectContentList(int rNum) {

		return recipeDao.selectContentList(rNum);
		
	}

	@Override
	public int deleteRecipeContent(int rNum) {

		return recipeDao.deleteRecipeContent(rNum);
		
	}

	@Override
	public int deleteRecipe(int rNum) {

		return recipeDao.deleteRecipe(rNum);
		
	}

}