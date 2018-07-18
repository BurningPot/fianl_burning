package com.kh.pot.ingredient.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.ingredient.model.vo.IngredientKeyword;

public interface IngredientService {
	//-----------------------HYD--------------------------------
	List<Ingredient> searchIngredientAjax(String keyword);

	List<Ingredient> selectDistinctName();

	List<Ingredient> selectBigCategory(String bCategory);

	List<Ingredient> selectSubCategory(String subCategory);

	List<Ingredient> showIngSearchResult(String iName);

	int deleteIngredient(int iNum);

	int updateIngInfo(int iNum, String img, int exdate, String iName);

	int deleteIngKeyword(int iNum);

	int insertNewKeyword(int iNum, String[] keywordArr);

	

	
	
	
	
	//-----------------------HYD--------------------------------
}
