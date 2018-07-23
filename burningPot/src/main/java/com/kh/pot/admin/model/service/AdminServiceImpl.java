package com.kh.pot.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pot.admin.model.dao.AdminDao;

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

}
