package com.kh.pot.member.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.pot.member.model.vo.Member;

public interface MemberService {

	List<Member> selectMemberList(int cPage, int limit, String customSelect, String keyword);
	Member selectOneMember(String mNum);
	int selectCountMember(int cPage, int limit, String customSelect, String keyword);
	
/* 예찬 부분 */
	int insertMember(Member member);
	int checkIdDuplicate(String mId);
	int checkEmailDuplicate(String email);
	Member selectMemberId(String userId);
	int checkNameDuplate(String mName);
	void regist(String email) throws Exception;
	int userAuth(String userEmail, String memberAuthKey);
	int deleteMail(String emailAddr);
	String checkEmailConfirm(String emailAddr);
/* 예찬 부분 끝 */
	
}
