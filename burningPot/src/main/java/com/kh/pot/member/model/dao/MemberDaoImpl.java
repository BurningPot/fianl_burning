package com.kh.pot.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pot.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSessionTemplate sqlSession;	
	
	@Override
	public List<Member> selectMemberList(int cPage, int limit, String customSelect, String keyword) {
		
		int startRow1 = (cPage - 1) * limit + 1;
		int endRow1 = startRow1 + limit - 1;
		
		String startRow = String.valueOf(startRow1);
		String endRow = String.valueOf(endRow1);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("customSelect", customSelect);
		map.put("keyword", keyword);		
		
		return sqlSession.selectList("member.selectMemberList", map);		
	}

	@Override
	public Member selectOneMember(String mNum) {
		
		return sqlSession.selectOne("member.selectOneMember", mNum);
	}

	

	@Override
	public int selectCountMember(int cPage, int limit, String customSelect, String keyword) {
		int startRow1 = (cPage - 1) * limit + 1;
		int endRow1 = startRow1 + limit - 1;
		
		String startRow = String.valueOf(startRow1);
		String endRow = String.valueOf(endRow1);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("customSelect", customSelect);
		map.put("keyword", keyword);		
		return sqlSession.selectOne("member.selectCountMember", map);
	}

	/* 예찬 부분 */
	

	@Override
	public int insertMember(Member member) {
		return sqlSession.insert("member.insertMember",member);
	}

	@Override
	public int checkIdDuplicate(String mId) {
		return sqlSession.selectOne("member.checkIdDuplicate", mId);
	}

	@Override
	public int checkEmailDuplicate(String email) {
		return sqlSession.selectOne("member.checkEmailDuplicate", email);
	}

	@Override
	public Member selectMemberId(String userId) {
		return sqlSession.selectOne("member.selectMemberId",userId);
	}

	@Override
	public int checkNameDuplicate(String mName) {
		return sqlSession.selectOne("member.checkNameDuplicate", mName);
	}

	@Override
	public int createAuthKey(Map<String, String> map) {
		return sqlSession.insert("member.createAuthKey", map);
	}

	@Override
	public int chkAuth(Map<String, String> map) {
		return sqlSession.selectOne("member.chkAuth", map);
	}

	@Override
	public int userAuth(String email) {
		return sqlSession.update("member.userAuth", email);
	}

	@Override
	public int deleteMail(String emailAddr) {
		return sqlSession.update("member.deleteMail", emailAddr);
	}

	@Override
	public String checkEmailConfirm(String emailAddr) {
		System.out.println("emailAddr : "+emailAddr);
		return sqlSession.selectOne("member.checkEmailConfirm", emailAddr);
	}

	
	/* 예찬 부분 */

}
