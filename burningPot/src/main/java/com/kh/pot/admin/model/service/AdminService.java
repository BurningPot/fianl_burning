package com.kh.pot.admin.model.service;


import java.util.ArrayList;
import java.util.List;

import com.kh.pot.admin.model.vo.Statistics;

public interface AdminService {

	List<Integer> selectAgeCount();

	List<Integer> selectGenderCount();

	List<Statistics> selectPopularRecipeRanking();

	List<Statistics> selectTopWriter();

	List<Statistics> selectMaleFavor();

	List<Statistics> selectFemaleFavor();

}
