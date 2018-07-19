package com.kh.pot.home.service;

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
	public List<Recipe> selectRecipe(int number) {
		return mainDao.selectRecipe(number);
	}

	@Override
	public List<Recipe> selectShowHome() {
		// TODO Auto-generated method stub
		return mainDao.selectShowHome();
	}

}
