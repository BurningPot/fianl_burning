package com.kh.pot.recipe.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pot.ingredient.model.vo.Ingredient;

@Repository
public class RecipeDaoImpl implements RecipeDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Ingredient> selectCategoryList() {
		
		return sqlSession.selectList("recipe.selectCategoryList");
		
	}

	@Override
	public List<Ingredient> selectIngredientList(String category) {

		return sqlSession.selectList("recipe.selectIngredientList", category);
		
	}

}