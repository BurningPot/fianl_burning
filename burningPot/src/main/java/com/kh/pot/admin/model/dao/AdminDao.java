package com.kh.pot.admin.model.dao;

import java.util.HashMap;
import java.util.List;

import com.kh.pot.admin.model.vo.Statistics;

public interface AdminDao {

	List<Integer> selectAgeCount();

	List<Integer> selectGenderCount();

	List<Statistics> selectPopularRecipeRanking();

	List<Statistics> selectTopWriter();

	List<Statistics> selectMaleFavor();

	List<Statistics> selectFemaleFavor();

	int updateExpelMember(HashMap<String, Object> map);

	int deleteAllContent(int mNum);

}
