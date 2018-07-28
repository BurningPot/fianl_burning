package com.kh.pot.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pot.admin.model.vo.Statistics;
import com.kh.pot.board.model.vo.Report;

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

	@Override
	public int updateExpelMember(HashMap<String, Object> map) {
		
		return sqlSession.update("member.updateExpelMember", map);
	}

	@Override
	public int deleteAllContent(int mNum) {
		
		return sqlSession.delete("member.deleteAllContent", mNum);
	}

	@Override
	public int selectReportCount() {
		
		return sqlSession.selectOne("board.selectReportCount");
	}

	@Override
	public List<Report> selectReport(int cPage, int numPerPage) {
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("board.selectReport", null, rows);
	}

	@Override
	public Report selectReportDetail(int rpNum) {
		
		return (Report) sqlSession.selectOne("board.selectReportDetail", rpNum);
	}

}
