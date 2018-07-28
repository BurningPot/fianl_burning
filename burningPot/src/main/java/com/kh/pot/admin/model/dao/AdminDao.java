package com.kh.pot.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.pot.admin.model.vo.Statistics;
import com.kh.pot.board.model.vo.Report;

public interface AdminDao {

	List<Integer> selectAgeCount();

	List<Integer> selectGenderCount();

	List<Statistics> selectPopularRecipeRanking();

	List<Statistics> selectTopWriter();

	List<Statistics> selectMaleFavor();

	List<Statistics> selectFemaleFavor();

	int updateExpelMember(HashMap<String, Object> map);

	int deleteAllContent(int mNum);

	int selectReportCount();

	List<Report> selectReport(int cPage, int numPerPage);

	Report selectReportDetail(int rpNum);

}
