package com.kh.pot.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pot.mypage.model.dao.MypageDao;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	MypageDao mypageDao;

/*	@Override
	public list<Mypage> selectMypageList() {
		
		return mypageDao.selectMypageList();
	}*/
	

}
