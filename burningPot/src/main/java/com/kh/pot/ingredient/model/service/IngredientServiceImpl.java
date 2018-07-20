package com.kh.pot.ingredient.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pot.ingredient.model.dao.IngredientDao;
import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.ingredient.model.vo.IngredientKeyword;

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

	@Override
	public int updateIngInfo(int iNum, String img, int exdate, String iName) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("iNum", iNum);
		map.put("iImage", img);
		map.put("exDate", exdate);
		map.put("iName", iName);	
		
		return ingDao.updateIngInfo(map);
	}
	

	@Override
	public int deleteIngKeyword(int iNum) {
		
		return ingDao.deleteIngKeyword(iNum);
	}

	@Override
	public int insertNewKeyword(int iNum, String[] keywordArr) {
		
		ArrayList<String> keywordList = new ArrayList<String>();
		
		for(int i = 1 ;i < keywordArr.length; i++){
			keywordList.add(keywordArr[i]);
		}
		
		return ingDao.insertNewKeyword(iNum, keywordList);
	}

	@Override
	public List<Ingredient> selectCategoryFirstChar() {
		
		return ingDao.selectCategoryFirstChar();
	}

	@Override
	public int insertNewCategory(String newCategory, String newSubCName, String bigCategory) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("newCategory", newCategory);
		map.put("newSubCName", newSubCName);
		map.put("bigCategory", bigCategory);
		
		return ingDao.insertNewCategory(map);
	}

	@Override
	public int deleteCategory(String cName, String subCName) {
		
		HashMap<String, String> map = new HashMap<String, String>();		
		map.put("cName", cName);
		map.put("subCName", subCName);
				
		return ingDao.deleteCategory(map);
	}

	
	

}
