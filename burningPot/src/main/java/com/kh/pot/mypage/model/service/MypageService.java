package com.kh.pot.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.kh.pot.member.model.vo.Member;

public interface MypageService {

	int checkNameDuplate(String mName);

	int checkIdDuplicate(String mId);

	List<Map<String, String>> selectMyBoardList(int cPage, int numPerPage);

	int selectMyBoardTotalContents();

	int deleteMyBoard(int bNum);

	int insertMember(Member member);

	int mypageEnrollEnd(String nic, String email, String password, String mId);

	int updateImg(String renameFileName, int numHidden);

	int deleteUserInfo(int formDel);

	
	
	

}
