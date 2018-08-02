package com.kh.pot.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.kh.pot.board.model.vo.Board;
import com.kh.pot.member.model.vo.Member;
import com.kh.pot.recipe.model.vo.Recipe;
import com.kh.pot.recipe.model.vo.Recommend;

public interface MypageService {

	int checkNameDuplate(String mName);

	int checkIdDuplicate(String mId);

	List<Map<String, String>> selectMyBoardList(int cPage, int numPerPage);

	int selectMyBoardTotalContents();

	int deleteMyRecipe(int rNum);

	int insertMember(Member member);

	int mypageEnrollEnd(String nic, String email, String password, String mId);

	int updateImg(String renameFileName, int numHidden);

	int deleteUserInfo(int formDel);

	List<Board> myPostList(int cPage, int numPerPage, int mNum);

	int selectMyPostTotalContents(int mNum);

	List<Recipe> myRecipeList(int cPage, int numPerPage, int mNum);

	int selectMyRecipeTotalContents(int mNum);

	Member myinfoDel(int mNum);

	int deleteMyPost(int bNum);

	List<Recipe> myLikeList(int cPage, int numPerPage, int mNum);

	int selectMyLikeTotalContents(int mNum);

	int cancelMyLike(int rNum, int mNum);

	
	
	

}
