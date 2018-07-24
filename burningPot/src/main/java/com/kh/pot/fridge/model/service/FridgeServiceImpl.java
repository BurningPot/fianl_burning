package com.kh.pot.fridge.model.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pot.fridge.model.dao.FridgeDao;
import com.kh.pot.fridge.model.vo.Fridge;
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

	@Override
	public int updateComplete(String inRef, int mNum, String mName, String mId) {
		int result = 0;
		String[] ref = inRef.split(",");
		List<String> inputIngre = new ArrayList<String>();
		Collections.addAll(inputIngre, ref);
		Map<String, Object> data = new HashMap<String, Object>();
		
		data.put("mNum", mNum);
		data.put("mName", mName);
		data.put("mId", mId);
		
		List<Fridge> checkFridge = friDao.checkFridge(data);
		List<Fridge> inIngre = new ArrayList<Fridge>();		// 기존에 있던 물품 중 현재도 담겨있는 것
		List<Fridge> delIngre = new ArrayList<Fridge>();	// 기존에 있던 물품 중 제거한 물품
		List<String> newIngre = new ArrayList<String>();	// 기존에 없다가 새로 들어온 물품
		
		if(checkFridge.isEmpty() || checkFridge == null) {
			data.put("ref", inputIngre);
			friDao.insertFridge(data);
		} else if(inputIngre.isEmpty() || inputIngre.get(0).equals("")){
			data.put("delIngre", checkFridge);
			friDao.deleteFridge(data);
		} else {
			for(Fridge origin : checkFridge){
				for(int i=0 ; i<inputIngre.size() ; i++){
					if(origin.getiNum() == Integer.parseInt(inputIngre.get(i))) {
						inIngre.add(origin);
					}
				}
			}
			
			System.out.println("유지된 물품 수 : "+inIngre.size());
			delIngre.addAll(checkFridge);
			System.out.println("지우기 전 물품 수 : "+delIngre.size());
			delIngre.removeAll(inIngre);
			
			newIngre.addAll(inputIngre);
			for(int i = 0 ; i < newIngre.size() ; i++){
				for(Fridge fri : inIngre){
					if(Integer.parseInt(newIngre.get(i)) == fri.getiNum()) {
						newIngre.remove(i);
					}
				}
			}
			
			System.out.println("지워야 할 물품 수 : "+delIngre.size());
			System.out.println("등록할 물품 수 : "+newIngre.size());
			
			data.put("delIngre", delIngre);
			data.put("ref", newIngre);
			
			if(delIngre.size() != 0){
				int del = friDao.deleteFridge(data);
				System.out.println("삭제 처리 수 : "+del);
				result += del;
			}
			
			if(newIngre.size() != 0){
				int ins = friDao.insertFridge(data);
				System.out.println("등록 처리 수 : "+ins);
				result += ins;
			}
			
		}
		
		return result;
	}

	@Override
	public List<Fridge> checkFridge(int mNum) {		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("mNum", mNum);
		
		return friDao.checkFridge(data);
	}

	
	
}
