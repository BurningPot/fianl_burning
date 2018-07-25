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
	public List<Recipe> selectShowHome() {

		return sqlSession.selectList("home.selectShowHome");
	}

	@Override
	public int selectCountAllRecipe() {
		
		return sqlSession.selectOne("home.selectCountAllRecipe");
	}

	@Override
	public List<Recipe> searchRecipe(String search) {

		return sqlSession.selectList("home.searchRecipe", search);
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
		
		return sqlSession.selectList("home.searchRecipeList", map);
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
	public List<Recipe> inquiryRecipeListBefore(String keyWord) {

		List<Recipe> rlist = sqlSession.selectList("home.inquiryRecipeListBefore", keyWord);
		
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

	
}
