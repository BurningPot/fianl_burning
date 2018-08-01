package com.kh.pot.fridge.model.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pot.fridge.model.dao.FridgeDao;
import com.kh.pot.fridge.model.vo.Fridge;
import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.recipe.model.vo.Recipe;

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
	public int updateComplete(String inRef, int mNum) {
		int result = 0;
		String[] ref = inRef.split(",");
		List<String> inputIngre = new ArrayList<String>();
		Collections.addAll(inputIngre, ref);
		Map<String, Object> data = new HashMap<String, Object>();
		System.out.println("들어온 물품 수 : "+inputIngre.size());
		
		data.put("mNum", mNum);
		
		List<Fridge> checkFridge = friDao.checkFridge(data);
		System.out.println("냉장고에 있는 수 : "+checkFridge.size());
		List<Fridge> inIngre = new ArrayList<Fridge>();		// 기존에 있던 물품 중 현재도 담겨있는 것
		List<Fridge> delIngre = new ArrayList<Fridge>();	// 기존에 있던 물품 중 제거한 물품
		List<String> newIngre = new ArrayList<String>();	// 기존에 없다가 새로 들어온 물품
		
		if(checkFridge.isEmpty() || checkFridge == null) {
			data.put("data", inputIngre);
			List<Fridge> newIngreObj = friDao.selectIngre(data);
			data.put("ref", newIngreObj);
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
			
			delIngre.addAll(checkFridge);
			delIngre.removeAll(inIngre);
			
			newIngre.addAll(inputIngre);
			for(int i = 0 ; i < newIngre.size() ; i++){
				for(Fridge fri : inIngre){
					if(Integer.parseInt(newIngre.get(i)) == fri.getiNum()) {
						newIngre.remove(i);
					}
				}
			}

			data.put("delIngre", delIngre);
			data.put("data", newIngre);
			
			if(delIngre.size() != 0){
				int del = friDao.deleteFridge(data);
				result += del;
			}
			
			if(newIngre.size() != 0){
				List<Fridge> newIngreObj = friDao.selectIngre(data);
				data.put("ref", newIngreObj);
				int ins = friDao.insertFridge(data);
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

	@Override
	public List<Recipe> findRecipe(ArrayList<String> inRef) {
		
		List<Recipe> list = new ArrayList<Recipe>();
		Map<String, Object> data = new HashMap<String, Object>();
		
		data.put("inRef", inRef);
		
		if(!inRef.isEmpty() || inRef.size()!=0) {
			list = friDao.findRecipe(data); 
		}
		
		return list;
	}

	@Override
	public List<List<Ingredient>> bringName(List<String> data) {
		List<List<Ingredient>> recList = new ArrayList<List<Ingredient>>();
		
		String[] arr = null;
		Map<String, String[]> daoData = new HashMap<String, String[]>();
		
		for(String str : data){
			arr = str.split(",");
			daoData.put("data", arr);
			List<Ingredient> recOne = friDao.bringName(daoData);
			recList.add(recOne);
		}
		
		return recList;
	}

	
	
}
