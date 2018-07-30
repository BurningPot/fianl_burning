package com.kh.pot.mypage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.kh.pot.board.model.vo.Board;

public interface MypageDao {

	int checkNameDuplicate(String mName);

	int checkIdDuplicate(String mId);

	List<Map<String, String>> selectMyBoardList(int cPage, int numPerPage);

	int selectMyBoardTotalContents();

	Board selectMyBoardOne(int bNum);

	int mypageEnrollEnd(HashMap<String, String> map);

	int updateImg(String renameFileName, int numHidden);

	int deleteUserInfo(int formDel);

	List<Board> myPostList(int mNum);

	int selectMyPostTotalContents();
	


}
