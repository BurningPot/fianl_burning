package com.kh.pot.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.pot.board.model.vo.Board;
import com.kh.pot.board.model.vo.BoardComment;

public interface BoardDao {

	List<Board> selectBoard(int cPage, int numPerPage, String bCategory);

	Board selectBoardDetail(HashMap<String, Object> map);

	int insertBoardComment(HashMap<String, Object> map);

	List<BoardComment> selectBoardComment(int bNum);

	int selectCount(String bCategory);

	int updateBoardReply(int bNum, String YorN);

	int deleteBoardComment(int bcNum);

	int deleteBoard(int bNum);

	
	/*yechan*/
	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	Board selectBoardOne(int boardNo);

	int updateBcount(int boardNo);
	/*yechan*/
	
}
