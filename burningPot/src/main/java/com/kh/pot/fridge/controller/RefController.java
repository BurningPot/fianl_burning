package com.kh.pot.fridge.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.pot.fridge.model.exception.FridgeException;
import com.kh.pot.fridge.model.service.FridgeService;
import com.kh.pot.fridge.model.vo.F_Recipe;
import com.kh.pot.fridge.model.vo.Fridge;
import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.member.model.vo.Member;
import com.kh.pot.recipe.model.vo.Recipe;

@Controller
public class RefController {

	@Autowired
	FridgeService friService;
	
	@RequestMapping("/fridge/refMain.do")
	public String refMain(HttpSession session, @RequestParam(value="inRef", required=false, defaultValue="") String inRef, Model model) throws FridgeException{
		
		Member m = (Member)session.getAttribute("m");
		
		if(m == null) throw new FridgeException("로그인 정보 없음!!!");
		
		/*if(!(inRef == "" || inRef.length() == 0))*/ friService.updateComplete(inRef, m.getmNum());
		
		List<Fridge> list = friService.checkFridge(m.getmNum());
		
		model.addAttribute("list", list);
		
		return "fridge/refMain";
	}

	@RequestMapping("/fridge/refUpdate.do")
	public String refUpdate(HttpSession session, Model model) throws FridgeException{

		Member m = (Member)session.getAttribute("m");
		
		if(m == null) throw new FridgeException("로그인 정보 없음!!!");
		
		List<Fridge> list = friService.checkFridge(m.getmNum());
		
		model.addAttribute("list", list);
		
		return "fridge/refUpdate";
	}
	
	@ResponseBody
	@RequestMapping("/fridge/checkCategory.do")
	public List<Ingredient> checkCategory(@RequestParam String keyword, @RequestParam(value="inRef", required=false, defaultValue="") ArrayList<String> inRef) {

		if(keyword.charAt(0) < 'A' || keyword.charAt(0) > 'F') System.out.println("재료 카테고리 에러");
		
		List<Ingredient> list = friService.checkCategory(keyword, inRef);
		
		return list;
	}

	@ResponseBody
	@RequestMapping("fridge/findRecipe.do")
	public List<F_Recipe> findRecipe(@RequestParam(value="inRef", required=false, defaultValue="") ArrayList<String> inRef){
		
		List<Recipe> list = friService.findRecipe(inRef);
		List<F_Recipe> newList = new ArrayList<F_Recipe>();
		List<String> data = new ArrayList<String>();
		F_Recipe fr;
		
		for(Recipe rec : list){
			fr = new F_Recipe();
			fr.setrNum(rec.getrNum());
			fr.setmNum(rec.getmNum());
			fr.setmName(rec.getmName());
			fr.setmId(rec.getmId());
			fr.setrName(rec.getrName());
			fr.setrImg(rec.getrImg());
			fr.setrIntro(rec.getrIntro());
			fr.setUntilReg(rec.getUntilReg());
			newList.add(fr);
			data.add(rec.getiNum());
		}

		List<List<Ingredient>> recIngre = friService.bringName(data);
		
		String newName;
		for(int i = 0 ; i < recIngre.size() ; i++){
			newName = "";
			List<Ingredient> recName = recIngre.get(i);
			for(int j = 0 ; j < recName.size() ; j++){
				if(j == recName.size()-1) newName += recName.get(j).getiName();
				else newName += recName.get(j).getiName()+", ";
			}
			newList.get(i).setiName(newName);
		}
		
		return newList;
	}
	
}
