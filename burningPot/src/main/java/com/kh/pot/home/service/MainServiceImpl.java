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
	public List<Recipe> selectRecipe(int startNumber, int endNumber, int mNum) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNumber", startNumber);
		map.put("endNumber", endNumber);
		map.put("mNum", mNum);
		
		return mainDao.selectRecipe(map);
	}

	@Override
	public List<Recipe> selectShowHome(int mNum) {

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("mNum", mNum);
		
		return mainDao.selectShowHome(map);
	}

	@Override
	public int selectCountAllRecipe() {

		return mainDao.selectCountAllRecipe();
	}

	@Override
	public List<Recipe> searchRecipe(String search, int mNum) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("mNum", mNum);
		
		return mainDao.searchRecipe(map);
	}

	@Override
	public int searchTotalCount(String keyWord) {

		return mainDao.searchTotalCount(keyWord);
	}

	@Override
	public List<Recipe> searchRecipeList(int searchStartCount, int searchEndCount, String keyWord, int mNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchStartCount", searchStartCount);
		map.put("searchEndCount", searchEndCount);
		map.put("keyWord", keyWord);
		map.put("mNum", mNum);
		
		
		return mainDao.searchRecipeList(map);
	}

	@Override
	public int searchTotalCountHome(String search) {

		return mainDao.searchTotalCountHome(search);
	}

	@Override
	public int inquiryTotalCount(String keyWord) {

		return mainDao.inquiryTotalCount(keyWord);
	}

	@Override
	public List<Recipe> inquiryRecipeListBefore(String keyWord, String AscAndDesc, int mNum) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("keyWord", keyWord);
		map.put("AscAndDesc", AscAndDesc);
		map.put("mNum", mNum);
		
		return mainDao.inquiryRecipeListBefore(map);
	}

	@Override
	public List<Recipe> inquiryRecipeListAfter(String keyWord, int inquiryStartCount, int inquiryEndCount, String AscAndDesc, int mNum) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("keyWord", keyWord);
		map.put("inquiryStartCount", inquiryStartCount);
		map.put("inquiryEndCount", inquiryEndCount);
		map.put("AscAndDesc", AscAndDesc);
		map.put("mNum", mNum);
		
		return mainDao.inquiryRecipeListAfter(map);
	}

	@Override
	public List<Recipe> recipeTop5() {

		
		return mainDao.recipeTop5();
	}

	@Override
	public List<Recipe> recommandRecipeListBefore(String keyWord, String AscAndDesc, int mNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("keyWord", keyWord);
		map.put("AscAndDesc", AscAndDesc);
		map.put("mNum", mNum);
				
		return mainDao.recommandRecipeListBefore(map);
	}

	@Override
	public int recommandTotalCount(String keyWord) {
		
		return mainDao.recommandTotalCount(keyWord);
	}

	@Override
	public List<Recipe> recommandRecipeListAfter(String keyWord, int recommandStartCount, int recommandEndCount, String AscAndDesc, int mNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("keyWord", keyWord);
		map.put("recommandStartCount", recommandStartCount);
		map.put("recommandEndCount", recommandEndCount);
		map.put("AscAndDesc", AscAndDesc);
		map.put("mNum", mNum);
		
		return mainDao.recommandRecipeListAfter(map);
	}

	@Override
	public List<Recipe> levelAndTimeRecipeListBefore(String keyWord, String AscAndDesc, int mNum) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("keyWord", keyWord);
		map.put("AscAndDesc", AscAndDesc);
		map.put("mNum", mNum);
		
		return mainDao.levelAndTimeRecipeListBefore(map);
	}

	@Override
	public int levelAndTimeAfterTotalCount(String keyWord) {

		return mainDao.levelAndTimeAfterTotalCount(keyWord);
	}

	@Override
	public List<Recipe> levelAndTimeRecipeListAfter(String keyWord, int levelAndTimeStartCount, int levelAndTimeEndCount, String AscAndDesc, int mNum) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("keyWord", keyWord);
		map.put("levelAndTimeStartCount", levelAndTimeStartCount);
		map.put("levelAndTimeEndCount", levelAndTimeEndCount);
		map.put("AscAndDesc", AscAndDesc);
		map.put("mNum", mNum);
		
		
		return mainDao.levelAndTimeRecipeListAfter(map);
	}

	@Override
	public int updatePlusRecommend(int recipeRNum) {
		
		return mainDao.updatePlusRecommend(recipeRNum);
	}

	@Override
	public int insertRecommend(int mNum, int recipeRNum) {

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("mNum", mNum);
		map.put("recipeRNum", recipeRNum);
		
		return mainDao.insertRecommend(map);
	}

	@Override
	public int updateMinusRecommend(int recipeRNum) {

		return mainDao.updateMinusRecommend(recipeRNum);
	}

	@Override
	public int deleteRecommend(int mNum, int recipeRNum) {

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("mNum", mNum);
		map.put("recipeRNum", recipeRNum);
		
		return mainDao.deleteRecommend(map);
	}
	
}
