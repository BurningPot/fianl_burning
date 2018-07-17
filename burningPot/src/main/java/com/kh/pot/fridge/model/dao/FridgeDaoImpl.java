package com.kh.pot.fridge.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pot.ingredient.model.vo.Ingredient;

@Repository
public class FridgeDaoImpl implements FridgeDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Ingredient> checkCategory(Map<String, Object> data) {
		List<Ingredient> list = new ArrayList<Ingredient>();
		list = sqlSession.selectList("fridge.checkCategory", data);
		return list;
	}

	
	
}
