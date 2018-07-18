package com.kh.pot.home.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pot.recipe.model.vo.Recipe;

@Repository
public class MainDaoImpl implements MainDao{

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Recipe> selectRecipe() {
		
		List<Recipe> listDao = sqlSession.selectList("home.selectRecipe");
		
		System.out.println("listDao : " + listDao);
		// return sqlSession.selectList("main.selectRecipe"); : mainMapper로 가는 것
		
		return listDao;
	}
}
