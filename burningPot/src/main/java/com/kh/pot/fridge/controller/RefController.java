package com.kh.pot.fridge.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.pot.fridge.model.service.FridgeService;
import com.kh.pot.ingredient.model.vo.Ingredient;

@Controller
public class RefController {

	@Autowired
	FridgeService friService;
	
	@RequestMapping("/fridge/refMain.do")
	public String refMain(){
		return "fridge/refMain";
	}

	@RequestMapping("/fridge/refUpdate.do")
	public String refUpdate(){
		return "fridge/refUpdate";
	}
	
	@ResponseBody
	@RequestMapping("/fridge/checkCategory.do")
	public List<Ingredient> checkCategory(@RequestParam String keyword, @RequestParam(value="inRef", required=false, defaultValue="") ArrayList<String> inRef){
							
		System.out.println("들어온 재료 수 : "+inRef.size());
		for(String str : inRef){
			System.out.println("들어온 재료 id : "+str);
		}
				
		List<Ingredient> list = friService.checkCategory(keyword, inRef);
		
		if(list == null){
			System.out.println("재료 카테고리 에러");
		}
		
		return list;
	}
	

}
