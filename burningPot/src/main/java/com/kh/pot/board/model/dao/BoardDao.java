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
	List<Map<String, String>> selectBoardList(Map<String, Object> map);

	int selectBoardTotalContents(Map<String, String> map);

	Board selectBoardOne(int boardNo);

	int updateBcount(int boardNo);
	int insertBoard(Board board);
	int updateBoard(Board board);
	int insertBoardCo(BoardComment bc);
	int updateBoardComment(BoardComment bc);
	/*yechan*/





	
}
