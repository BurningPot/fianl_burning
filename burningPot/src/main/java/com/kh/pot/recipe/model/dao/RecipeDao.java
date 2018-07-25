package com.kh.pot.recipe.model.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.recipe.model.vo.Recipe;
import com.kh.pot.recipe.model.vo.RecipeContent;

public interface RecipeDao {
	
	List<Ingredient> selectCategoryList();

	List<Ingredient> selectIngredientList(String category);

	int insertRecipe(Recipe recipe);

	int insertRecipeContent(RecipeContent recipeContent);

	String renameFile(MultipartFile file);

	Recipe selectRecipeDetail(int rNum);

	List<Ingredient> selectMainIngredientList(Map mainNameMap);

	List<RecipeContent> selectContentList(int rNum);

	int deleteRecipeContent(int rNum);

	int deleteRecipe(int rNum);

}