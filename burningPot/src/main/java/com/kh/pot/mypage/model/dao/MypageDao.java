package com.kh.pot.mypage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.kh.pot.board.model.vo.Board;
import com.kh.pot.member.model.vo.Member;
import com.kh.pot.recipe.model.vo.Recipe;
import com.kh.pot.recipe.model.vo.Recommend;

public interface MypageDao {

	int checkNameDuplicate(String mName);

	int checkIdDuplicate(String mId);

	List<Map<String, String>> selectMyBoardList(int cPage, int numPerPage);

	int selectMyBoardTotalContents();

	Board selectMyBoardOne(int bNum);

	int mypageEnrollEnd(HashMap<String, String> map);

	int updateImg(String renameFileName, int numHidden);

	int deleteUserInfo(int formDel);

	List<Board> myPostList(int cPage, int numPerPage, int mNum);

	int selectMyPostTotalContents(int mNum);

	List<Recipe> myRecipeList(int cPage, int numPerPage, int mNum);

	int selectMyRecipeTotalContents(int mNum);

	int deleteMyRecipe(int rNum);

	Member myinfoDel(int mNum);

	int deleteMyPost(int bNum);

	List<Recipe> myLikeList(int cPage, int numPerPage, int mNum);

	int selectMyLikeTotalContents(int mNum);

	int cancelMyLike(int rNum, int mNum);
	


}
