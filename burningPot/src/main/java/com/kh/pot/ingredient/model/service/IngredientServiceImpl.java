package com.kh.pot.ingredient.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pot.ingredient.model.dao.IngredientDao;
import com.kh.pot.ingredient.model.vo.Ingredient;

@Service
public class IngredientServiceImpl implements IngredientService {	
	
	@Autowired
	IngredientDao ingDao;
	
	@Override
	public List<Ingredient> searchIngredientAjax(String keyword) {
		
		return ingDao.searchIngredientAjax(keyword);
	}

	@Override
	public List<Ingredient> selectDistinctName() {
		
		return ingDao.selectDistinctName();
	}

	@Override
	public List<Ingredient> selectBigCategory(String bCategory) {
		
		return ingDao.selectBigCategory(bCategory);
	}

	@Override
	public List<Ingredient> selectSubCategory(String subCategory) {
		
		return ingDao.selectSubCategory(subCategory);
	}

	@Override
	public List<Ingredient> showIngSearchResult(String iName) {
		
		return ingDao.showIngSearchResult(iName);
	}

	@Override
	public int deleteIngredient(int iNum) {
		
		return ingDao.deleteIngredient(iNum);
	}

}
