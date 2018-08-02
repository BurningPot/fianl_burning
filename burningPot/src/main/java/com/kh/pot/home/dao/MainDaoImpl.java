package com.kh.pot.home.dao;

import java.util.HashMap;
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
	public List<Recipe> selectRecipe(HashMap<String, Integer> map) {
		
		return sqlSession.selectList("home.selectRecipe", map);
	}

	@Override
	public List<Recipe> selectShowHome(HashMap<String, Integer> map) {
		
		return sqlSession.selectList("home.selectShowHome", map);
	}

	@Override
	public int selectCountAllRecipe() {
		
		return sqlSession.selectOne("home.selectCountAllRecipe");
	}

	@Override
	public List<Recipe> searchRecipe(HashMap<String, Object> map) {

		return sqlSession.selectList("home.searchRecipe", map);
	}

	@Override
	public int searchTotalCount(String keyWord) {
		
		return sqlSession.selectOne("home.searchTotalCount", keyWord);
	}

	@Override
	public List<Recipe> searchRecipeList(HashMap<String, Object> map) {
		System.out.println("map : " + map.get("searchStartCount"));
		System.out.println("map : " + map.get("searchEndCount"));
		System.out.println("map : " + map.get("keyWord"));
		System.out.println("map : " + map.get("mNum"));
		List<Recipe> list = sqlSession.selectList("home.searchRecipeList", map);
		for(int i = 0; i < list.size(); i++){
			System.out.println("getrName : " + list.get(i).getrName());
			System.out.println("getRcCheck : " + list.get(i).getRcCheck());
		}
		
		return list;
	}

	@Override
	public int searchTotalCountHome(String search) {

		return sqlSession.selectOne("home.searchTotalCountHome", search);
	}

	@Override
	public int inquiryTotalCount(String keyWord) {

		return sqlSession.selectOne("home.inquiryTotalCount", keyWord);
	}

	@Override
	public List<Recipe> inquiryRecipeListBefore(HashMap<String, Object> map) {

		List<Recipe> rlist = sqlSession.selectList("home.inquiryRecipeListBefore", map);
		
		System.out.println("inquiryRecipeList DaoImpl : " + rlist);
		
		return rlist;
	}

	@Override
	public List<Recipe> inquiryRecipeListAfter(HashMap<String, Object> map) {

		List<Recipe> rlist = sqlSession.selectList("home.inquiryRecipeListAfter", map);
		
		for(int i = 0 ; i<rlist.size(); i++){
			System.out.println("조회수 순서로 정렬 후 무한 스크롤 : " + rlist.get(i).getrName());
		}
		
		return rlist;
	}
	
	@Override
	public List<Recipe> recipeTop5() {

		return sqlSession.selectList("home.recipeTop5");
	}

	@Override
	public List<Recipe> recommandRecipeListBefore(HashMap<String, Object> map) {

		List<Recipe> recommandRecipeListBefore = sqlSession.selectList("home.recommandRecipeListBefore", map);
		
		return recommandRecipeListBefore;
	}

	@Override
	public int recommandTotalCount(String keyWord) {

		return sqlSession.selectOne("home.recommandTotalCount", keyWord);
	}

	@Override
	public List<Recipe> recommandRecipeListAfter(HashMap<String, Object> map) {

		return sqlSession.selectList("home.recommandRecipeListAfter", map);
	}

	@Override
	public List<Recipe> levelAndTimeRecipeListBefore(HashMap<String, Object> map) {

		return sqlSession.selectList("home.levelAndTimeRecipeListBefore", map);
	}

	@Override
	public int levelAndTimeAfterTotalCount(String keyWord) {

		return sqlSession.selectOne("home.levelAndTimeAfterTotalCount", keyWord);
	}

	@Override
	public List<Recipe> levelAndTimeRecipeListAfter(HashMap<String, Object> map) {

		return sqlSession.selectList("home.levelAndTimeRecipeListAfter", map);
	}

	@Override
	public int updatePlusRecommend(int recipeRNum) {

		return sqlSession.update("home.updatePlusRecommend", recipeRNum);
	}

	@Override
	public int insertRecommend(HashMap<String, Integer> map) {

		return sqlSession.insert("home.insertRecommend", map);
	}

	@Override
	public int updateMinusRecommend(int recipeRNum) {

		return sqlSession.update("home.updateMinusRecommend", recipeRNum);
	}

	@Override
	public int deleteRecommend(HashMap<String, Integer> map) {

		return sqlSession.delete("home.deleteRecommend", map);
	}


	
}
