package com.kh.pot.home.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pot.home.dao.MainDao;
import com.kh.pot.recipe.model.vo.Recipe;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainDao mainDao;
	
	@Override
	public List<Recipe> selectRecipe(int startNumber, int endNumber) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNumber", startNumber);
		map.put("endNumber", endNumber);
		
		
		return mainDao.selectRecipe(map);
	}

	@Override
	public List<Recipe> selectShowHome() {
		// TODO Auto-generated method stub
		return mainDao.selectShowHome();
	}

	@Override
	public int selectCountAllRecipe() {
		// TODO Auto-generated method stub
		return mainDao.selectCountAllRecipe();
	}

}
