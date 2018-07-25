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

	@Override
	public List<Recipe> searchRecipe(String search) {

		return mainDao.searchRecipe(search);
	}

	@Override
	public int searchTotalCount(String keyWord) {
		// TODO Auto-generated method stub
		return mainDao.searchTotalCount(keyWord);
	}

	@Override
	public List<Recipe> searchRecipeList(int searchStartCount, int searchEndCount, String keyWord) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchStartCount", searchStartCount);
		map.put("searchEndCount", searchEndCount);
		map.put("keyWord", keyWord);
		
		
		return mainDao.searchRecipeList(map);
	}

	@Override
	public int searchTotalCountHome(String search) {
		// TODO Auto-generated method stub
		return mainDao.searchTotalCountHome(search);
	}

	@Override
	public int inquiryTotalCount(String keyWord) {

		return mainDao.inquiryTotalCount(keyWord);
	}

	@Override
	public List<Recipe> inquiryRecipeListBefore(String keyWord) {

		return mainDao.inquiryRecipeListBefore(keyWord);
	}

	@Override
	public List<Recipe> inquiryRecipeListAfter(String keyWord, int inquiryStartCount, int inquiryEndCount) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("keyWord", keyWord);
		map.put("inquiryStartCount", inquiryStartCount);
		map.put("inquiryEndCount", inquiryEndCount);
		
		return mainDao.inquiryRecipeListAfter(map);
	}
	
	/*@Override
	public List<Recipe> inquiryRecipeList(String keyWord, int number) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("keyWord", keyWord);
		map.put("number, value)
		
		return mainDao.inquiryRecipeList(keyWord, number);
	}*/

	


//	@Override
//	public List<Recipe> searchListScroll(int searchStartRecipe, int searchEndRecipe) {
//		// List는 2개의 값을 동시에 보낼 수 없으므로, Map을 사용하여 DB에 보낸다.
//		HashMap<String, Integer> searchMap = new HashMap<String, Integer>();
//		searchMap.put("searchStartRecipe", searchStartRecipe);
//		searchMap.put("searchEndRecipe", searchEndRecipe);
//			
//		return mainDao.searchListScroll(searchMap);
//	}



}
