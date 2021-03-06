package com.kh.pot.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.pot.member.model.vo.Member;

public interface MemberDao {
	
	List<Member> selectMemberList(int cPage, int limit, String customSelect, String keyword); 
	Member selectOneMember(String mNum);
	
	int selectCountMember(int cPage, int limit, String customSelect, String keyword);
	
	
	/* 예찬 부분 */
	int insertMember(Member member);
	int checkIdDuplicate(String mId);
	int checkEmailDuplicate(String email);
	Member selectMemberId(String userId);
	int checkNameDuplicate(String mName);
	int createAuthKey(Map<String, String> map);
	int chkAuth(Map<String, String> map);
	int userAuth(String email);
	int deleteMail(String emailAddr);
	String checkEmailConfirm(String emailAddr);
	String findMemberId(HashMap<String, String> map);
	Member findMemberPwd(HashMap<String, String> map);
	int updatePwd(Map<String, String> map);
	String selectEmailConfirm(String email);
	Member selectMemberEmail(String email);
	/* 예찬 부분 */
}
