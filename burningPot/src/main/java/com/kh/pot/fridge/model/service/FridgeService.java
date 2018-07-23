package com.kh.pot.fridge.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.pot.fridge.model.vo.Fridge;
import com.kh.pot.ingredient.model.vo.Ingredient;

public interface FridgeService {

	List<Ingredient> checkCategory(String keyword, ArrayList<String> inRef);

	int updateComplete(String inRef, int mNum, String mName, String mId);
	
	List<Fridge> checkFridge(int mNum);

}
