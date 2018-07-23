package com.kh.pot.mypage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pot.board.model.vo.Board;

@Repository
public class MypageDaoImpl implements MypageDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int checkNameDuplicate(String mName) {
		return 0;
	}

	@Override
	public int checkIdDuplicate(String mId) {		
		return 0;
	}
	@Override
	public List<Map<String, String>> selectMyBoardList(int cPage, int numPerPage) {
		
		/*
		 * RowBounds(offset, limit)
		 * offset : 최초 게시글 번호(1페이지면 1, 2페이지면 11 . . .)
		 * limit : 제한 게시글 (최초 게시글로부터 10개)
		 */
		System.out.println("offset : " + (cPage-1)*numPerPage);
		System.out.println("limit : " + numPerPage);
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);

		return sqlSession.selectList("mypage.selectMyBoardList", null, rows);
	}
	
	@Override
	public int selectMyBoardTotalContents() {
		return sqlSession.selectOne("mypage.selectMyBoardTotalContents");
	}
	
	@Override
	public Board selectMyBoardOne(int bNum) {
		return sqlSession.selectOne("mypage.selectMyBoardOne", bNum);
	}

	@Override
	public int mypageEnrollEnd(HashMap<String, String> map) {
		
		return sqlSession.update("mypage.updatemypageEnrollEnd", map);
	}
	
	

		
	} 

	



