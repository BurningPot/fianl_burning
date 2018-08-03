package com.kh.pot.admin.model.service;


import java.util.ArrayList;
import java.util.List;

import com.kh.pot.admin.model.vo.Statistics;
import com.kh.pot.board.model.vo.Report;
import com.kh.pot.recipe.model.vo.Recipe;

public interface AdminService {

	List<Integer> selectAgeCount();

	List<Integer> selectGenderCount();

	List<Statistics> selectPopularRecipeRanking();

	List<Statistics> selectTopWriter();

	List<Statistics> selectMaleFavor();

	List<Statistics> selectFemaleFavor();

	int updateExpelMember(String mId, String newPw, int mNum);

	int deleteAllContent(int mNum);

	int selectReportCount();

	List<Report> selectReport(int cPage, int numPerPage);

	Report selectReportDetail(int rpNum);

	Recipe selectReportedRecipe(int rpNum);

	int deleteRecipe(int rNum);

	String selectPhoto(int mNum);

	String selectCategoryOfMember(int mNum);

}
