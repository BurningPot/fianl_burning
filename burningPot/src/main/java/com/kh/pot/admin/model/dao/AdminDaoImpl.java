package com.kh.pot.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pot.admin.model.vo.Statistics;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Integer> selectAgeCount() {
		
		return sqlSession.selectList("member.selectAgeCount");
	}

	@Override
	public List<Integer> selectGenderCount() {
		
		return sqlSession.selectList("member.selectGenderCount");
	}

	@Override
	public List<Statistics> selectPopularRecipeRanking() {
		
		return sqlSession.selectList("member.selectPopularRecipeRanking");
	}

	@Override
	public List<Statistics> selectTopWriter() {
		
		return sqlSession.selectList("member.selectTopWriter");
	}

	@Override
	public List<Statistics> selectMaleFavor() {
		
		return sqlSession.selectList("member.selectMaleFavor");
	}

	@Override
	public List<Statistics> selectFemaleFavor() {
		
		return sqlSession.selectList("member.selectFemaleFavor");
	}

}
