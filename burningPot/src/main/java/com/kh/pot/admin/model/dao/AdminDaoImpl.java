package com.kh.pot.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
