package com.kh.pot.mypage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.pot.board.model.vo.Board;
import com.kh.pot.member.model.vo.Member;
import com.kh.pot.mypage.model.dao.MypageDao;
import com.kh.pot.recipe.model.vo.Recipe;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	MypageDao mypageDao;

/*	@Override
	public list<Mypage> selectMypageList() {
		
		return mypageDao.selectMypageList();
	}*/
	
	@Override
	public int checkNameDuplate(String mName) {
		return mypageDao.checkNameDuplicate(mName);
	}

	@Override
	public int checkIdDuplicate(String mId) {
		return mypageDao.checkIdDuplicate(mId);
	}

	@Override
	public List<Map<String, String>> selectMyBoardList(int cPage, int numPerPage) {
		
		return mypageDao.selectMyBoardList(cPage, numPerPage);
	}

	@Override
	public int selectMyBoardTotalContents() {
		
		return mypageDao.selectMyBoardTotalContents();
	}

	@Override
	public int deleteMyRecipe(int rNum) {
		
		return mypageDao.deleteMyRecipe(rNum);
	}

	@Override
	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int mypageEnrollEnd(String nic, String email, String password, String mId) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("nic", nic);
		map.put("email", email);
		map.put("password", password);
		map.put("mId", mId);
		return mypageDao.mypageEnrollEnd(map);
	}

	@Override
	public int updateImg(String renameFileName, int numHidden) {
		
		return mypageDao.updateImg(renameFileName, numHidden);
	}

	@Override
	public int deleteUserInfo(int formDel) {
		
		return mypageDao.deleteUserInfo(formDel);
	}

	@Override
	public List<Board> myPostList(int mNum) {
		
		return mypageDao.myPostList(mNum);
	}

	@Override
	public int selectMyPostTotalContents() {

		return mypageDao.selectMyPostTotalContents();
	}

	@Override
	public List<Recipe> myRecipeList(int mNum) {
		return mypageDao.myRecipeList(mNum);
	}

	@Override
	public int selectMyRecipeTotalContents() {
		return mypageDao.selectMyRecipeTotalContents();
	}

	@Override
	public Member myinfoDel(int mNum) {
		return mypageDao.myinfoDel(mNum);
	}

	@Override
	public int deleteMyPost(int bNum) {
		return mypageDao.deleteMyPost(bNum);
	}
	

}
