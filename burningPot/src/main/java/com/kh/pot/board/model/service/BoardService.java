package com.kh.pot.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.pot.board.model.vo.Board;
import com.kh.pot.board.model.vo.BoardComment;

public interface BoardService {

	//---- HYD --------
	List<Board> selectBoard(int cPage, int numPerPage, String bCategory);

	Board selectBoardDetail(String bCategory, int bNum);

	int insertBoardComment(HashMap<String, Object> map);

	List<BoardComment> selectBoardComment(int bNum);
	
	int selectCount(String bCategory);
	
	int updateBoardReply(int bNum, boolean YorN);

	int deleteBoardComment(int bcNum);
	
	int deleteBoard(int bNum);

	

	

	
	
	
	
	//---- HYD --------
	
	
	/* 예찬 부분 */
	
	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	Board selectBoardOne(int boardNo);
	
	/* 예찬 부분 */
	
	

}
