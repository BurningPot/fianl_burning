package com.kh.pot.ingredient.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.pot.ingredient.model.vo.Ingredient;

public interface IngredientDao {

	List<Ingredient> searchIngredientAjax(String keyword);

	List<Ingredient> selectDistinctName();

	List<Ingredient> selectBigCategory(String bCategory);

	List<Ingredient> selectSubCategory(String subCategory);

	List<Ingredient> showIngSearchResult(String iName);

	int deleteIngredient(int iNum);

	int updateIngInfo(HashMap<String, Object> map);

	int updateIngKeyword(int iNum, String[] keywordArr);

	

}
