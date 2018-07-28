package com.kh.pot.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pot.admin.model.dao.AdminDao;
import com.kh.pot.admin.model.vo.Statistics;
import com.kh.pot.board.model.vo.Report;

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

	@Override
	public int updateExpelMember(String mId, String newPw, int mNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mId", mId);
		map.put("password", newPw);
		map.put("mNum", mNum);
		return adminDao.updateExpelMember(map);
	}

	@Override
	public int deleteAllContent(int mNum) {
		
		return adminDao.deleteAllContent(mNum);
	}

	@Override
	public int selectReportCount() {
		
		return adminDao.selectReportCount();
	}

	@Override
	public List<Report> selectReport(int cPage, int numPerPage) {
		
		return adminDao.selectReport(cPage, numPerPage);
	}

	@Override
	public Report selectReportDetail(int rpNum) {
		
		return adminDao.selectReportDetail(rpNum);
	}

}
