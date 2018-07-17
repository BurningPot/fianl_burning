package com.kh.pot.fridge.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pot.fridge.model.dao.FridgeDao;
import com.kh.pot.ingredient.model.vo.Ingredient;

@Service
public class FridgeServiceImpl implements FridgeService {

	@Autowired
	FridgeDao friDao;
	
	@Override
	public List<Ingredient> checkCategory(String keyword, ArrayList<String> inRef) {
		
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("keyword", keyword);
		data.put("inRef", inRef);
		
		List<Ingredient> list = friDao.checkCategory(data);
		
		return list;
	}

}
