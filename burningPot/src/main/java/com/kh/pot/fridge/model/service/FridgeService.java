package com.kh.pot.fridge.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.pot.ingredient.model.vo.Ingredient;

public interface FridgeService {

	List<Ingredient> checkCategory(String keyword, ArrayList<String> inRef);

}
