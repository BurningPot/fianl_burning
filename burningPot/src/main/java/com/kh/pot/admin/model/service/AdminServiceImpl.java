package com.kh.pot.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pot.admin.model.dao.AdminDao;
import com.kh.pot.admin.model.vo.Statistics;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao adminDao;
	
	@Override
	public List<Integer> selectAgeCount() {
				
		return adminDao.selectAgeCount();
	}

	@Override
	public List<Integer> selectGenderCount() {
		
		return adminDao.selectGenderCount();
	}

	@Override
	public List<Statistics> selectPopularRecipeRanking() {
		
		return adminDao.selectPopularRecipeRanking();
	}

	@Override
	public List<Statistics> selectTopWriter() {
		
		return adminDao.selectTopWriter();
	}

	@Override
	public List<Statistics> selectMaleFavor() {
		
		return adminDao.selectMaleFavor();
	}

	@Override
	public List<Statistics> selectFemaleFavor() {
		
		return adminDao.selectFemaleFavor();
	}

}
