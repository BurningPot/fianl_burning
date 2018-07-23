package com.kh.pot.admin.model.dao;

import java.util.List;

public interface AdminDao {

	List<Integer> selectAgeCount();

	List<Integer> selectGenderCount();

}
