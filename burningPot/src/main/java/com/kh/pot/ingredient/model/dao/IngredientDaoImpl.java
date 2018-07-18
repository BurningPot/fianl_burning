package com.kh.pot.ingredient.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.ingredient.model.vo.IngredientKeyword;

@Repository
public class IngredientDaoImpl implements IngredientDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Ingredient> searchIngredientAjax(String keyword) {
		
		return sqlSession.selectList("ingredient.searchIngredientAjax", keyword);
	}

	@Override
	public List<Ingredient> selectDistinctName() {
		
		return sqlSession.selectList("ingredient.selectDistinctName");
	}

	@Override
	public List<Ingredient> selectBigCategory(String bCategory) {
		
		return sqlSession.selectList("ingredient.selectBigCategory", bCategory);
	}

	@Override
	public List<Ingredient> selectSubCategory(String subCategory) {
		
		return sqlSession.selectList("ingredient.selectSubCategory", subCategory);
	}

	@Override
	public List<Ingredient> showIngSearchResult(String iName) {
		
		return sqlSession.selectList("ingredient.showIngSearchResult",iName);
	}

	@Override
	public int deleteIngredient(int iNum) {
		
		return sqlSession.delete("ingredient.deleteIngredient", iNum);
	}

	@Override
	public int updateIngInfo(HashMap<String, Object> map) {
		
		return sqlSession.update("ingredient.updateIngInfo", map);
	}

	@Override
	public int deleteIngKeyword(int iNum) {
		
		return sqlSession.delete("ingredientKeyword.deleteIngKeyword", iNum);
	}

	@Override
	public int insertNewKeyword(int iNum, ArrayList<String> keywordList) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("iNum", iNum);
		int result = 0;
		
		for(int i = 0 ; i< keywordList.size();i++){
			if(i == 0){
				map.put("keyword", keywordList.get(i));
				result += sqlSession.insert("ingredientKeyword.insertNewKeyword", map);
			}else{
				map.remove("keyword");
				map.put("keyword", keywordList.get(i));
				result += sqlSession.insert("ingredientKeyword.insertNewKeyword", map);
			}
			
		}
		
		
		
		return 0;
	}

	
	
}
