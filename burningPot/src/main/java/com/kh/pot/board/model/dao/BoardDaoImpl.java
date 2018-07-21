package com.kh.pot.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pot.board.model.vo.Board;
import com.kh.pot.board.model.vo.BoardComment;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Board> selectBoard(int cPage, int numPerPage, String bCategory) {
		
		/*
		 * RowBounds(offset, limit)
		 * offset : 최초 게시글 번호(1페이지면 1번, 2페이지면 11번 . . . )
		 * limit : 제한 게시글 (최초 게시글로부터 10개)
		 * 
		 * */
		System.out.println("offset : "+(cPage-1)*numPerPage);
		System.out.println("limit : "+numPerPage);
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("board.selectBoard", bCategory, rows);
	}

	@Override
	public Board selectBoardDetail(HashMap<String, Object> map) {
		
		return sqlSession.selectOne("board.selectBoardDetail", map);
	}

	@Override
	public int insertBoardComment(HashMap<String, Object> map) {
		
		return sqlSession.insert("boardComment.insertBoardComment", map);
	}

	@Override
	public List<BoardComment> selectBoardComment(int bNum) {
		
		return sqlSession.selectList("boardComment.selectBoardComment", bNum);
	}

	@Override
	public int selectCount(String bCategory) {
		
		return sqlSession.selectOne("board.selectCount", bCategory);
	}

	@Override
	public int updateBoardReply(int bNum, String YorN) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bNum", bNum);
		map.put("YorN", YorN);
		return sqlSession.update("board.updateBoardReply", map);
	}

	@Override
	public int deleteBoardComment(int bcNum) {
		
		return sqlSession.delete("boardComment.deleteBoardComment", bcNum);
	}

	@Override
	public int deleteBoard(int bNum) {
		
		return sqlSession.delete("board.deleteBoard", bNum);
	}

	/*예찬 부분*/
	
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)* numPerPage, numPerPage);
		return sqlSession.selectList("board.selectBoardList", null, rows);
	}

	@Override
	public int selectBoardTotalContents() {
		return sqlSession.selectOne("board.selectBoardTotalContents");
	}

	@Override
	public int updateBcount(int boardNo) {
		return sqlSession.update("board.updateBcount",boardNo);
	}

	@Override
	public Board selectBoardOne(int boardNo) {
		return sqlSession.selectOne("board.selectBaordOne",boardNo);
	}

	@Override
	public int insertBoard(Board board) {
		return sqlSession.insert("board.insertBoard",board);
	}

	@Override
	public int updateBoard(Board board) {
		return sqlSession.update("board.updateBoard",board);
	}

	@Override
	public int insertBoardCo(BoardComment bc) {
		return sqlSession.insert("boardComment.insertBoardCo",bc);
	}


	/*예찬 부분 끝*/
	
	
}
