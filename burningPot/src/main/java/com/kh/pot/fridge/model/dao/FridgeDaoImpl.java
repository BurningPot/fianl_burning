package com.kh.pot.fridge.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pot.fridge.model.vo.Fridge;
import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.recipe.model.vo.Recipe;

@Repository
public class FridgeDaoImpl implements FridgeDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Ingredient> checkCategory(Map<String, Object> data) {
		return sqlSession.selectList("fridge.checkCategory", data);
	}

	@Override
	public List<Fridge> checkFridge(Map<String, Object> data) {
		return sqlSession.selectList("fridge.checkFridge", data);
	}

	@Override
	public int insertFridge(Map<String, Object> data) {
		return sqlSession.insert("fridge.insertFridge", data);
	}

	@Override
	public int deleteFridge(Map<String, Object> data) {
		return sqlSession.delete("fridge.deleteFridge", data);
	}

	@Override
	public List<Recipe> findRecipe(Map<String, Object> data) {
		return sqlSession.selectList("fridge.findRecipe", data);
	}

	@Override
	public List<Ingredient> bringName(Map<String, String[]> data) {
		return sqlSession.selectList("fridge.bringName", data);
	}

	
}
