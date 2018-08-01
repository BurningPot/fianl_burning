package com.kh.pot.mypage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.pot.board.model.vo.Board;
import com.kh.pot.member.model.vo.Member;
import com.kh.pot.recipe.model.vo.Recipe;

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

	@Override
	public int updateImg(String renameFileName, int numHidden) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("renameFileName", renameFileName);
		map.put("numHidden", numHidden);
		return sqlSession.update("mypage.updateImg", map);
	}

	@Override
	public int deleteUserInfo(int formDel) {		
		return sqlSession.delete("mypage.deleteUserInfo", formDel);
	}

	@Override
	public List<Board> myPostList(int cPage, int numPerPage, int mNum) {
		
		RowBounds rows = new RowBounds( (cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("mypage.seleteMyPostList", mNum, rows);
	}

	@Override
	public int selectMyPostTotalContents(int mNum) {
		return sqlSession.selectOne("mypage.selectMyPostTotalContents", mNum);	
	
	}

	@Override
	public List<Recipe> myRecipeList(int cPage, int numPerPage, int mNum) {
						
		RowBounds rows = new RowBounds( (cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("mypage.selectMyRecipeList", mNum, rows);
	}

	@Override
	public int selectMyRecipeTotalContents(int mNum) {
		return sqlSession.selectOne("mypage.selectMyRecipeTotalContents", mNum);
	}

	@Override
	public int deleteMyRecipe(int rNum) {
		
		return sqlSession.delete("mypage.deleteMyRecipe", rNum);
	}

	@Override
	public Member myinfoDel(int mNum) {
		return sqlSession.selectOne("mypage.myinfoDel", mNum);
	}

	@Override
	public int deleteMyPost(int bNum) {
		return sqlSession.delete("mypage.deleteMyPost", bNum);
	}
		
	} 

	



