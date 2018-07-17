package com.kh.pot.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pot.board.model.dao.BoardDao;
import com.kh.pot.board.model.vo.Board;
import com.kh.pot.board.model.vo.BoardComment;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao boardDao;
	
	//-----------------------HYD----------------------------
	@Override
	public List<Board> selectBoard(int cPage, int numPerPage, String bCategory) {
		
		return boardDao.selectBoard(cPage, numPerPage, bCategory);
	}

	@Override
	public Board selectBoardDetail(String bCategory, int bNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bCategory", bCategory);
		map.put("bNum", bNum);
		return boardDao.selectBoardDetail(map);
	}
	

	@Override
	public int insertBoardComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardDao.insertBoardComment(map);
	}

	@Override
	public List<BoardComment> selectBoardComment(int bNum) {
		
						
		return boardDao.selectBoardComment(bNum);
	}

	@Override
	public int selectCount(String bCategory) {
		
		return boardDao.selectCount(bCategory);
	}

	@Override
	public int updateBoardReply(int bNum, boolean YorN) {
		System.out.println("YorN :"+YorN);
		String alterYorN = "";
		if(YorN){
			alterYorN = "Y";
		}else{
			alterYorN = "N";
		}
		
		return boardDao.updateBoardReply(bNum, alterYorN);
	}

	@Override
	public int deleteBoardComment(int bcNum) {
		
		return boardDao.deleteBoardComment(bcNum);
	}

	@Override
	public int deleteBoard(int bNum) {
		
		return boardDao.deleteBoard(bNum);
	}

	
	

	
	
	
	
	
	
	
	
	//-----------------------HYD----------------------------
	
	/* 예찬 부분 */
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		return boardDao.selectBoardList(cPage, numPerPage);
	}

	@Override
	public int selectBoardTotalContents() {
		return boardDao.selectBoardTotalContents();
	}

	@Override
	public Board selectBoardOne(int boardNo) {
		int result = boardDao.updateBcount(boardNo);
		if(result > 0 ) return boardDao.selectBoardOne(boardNo);
		else return null;
	}
	
	/* 예찬 부분 */
}
