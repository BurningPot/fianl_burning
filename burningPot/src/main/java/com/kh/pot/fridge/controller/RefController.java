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
import com.kh.pot.fridge.model.vo.Fridge;
import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.member.model.vo.Member;

@Controller
public class RefController {

	@Autowired
	FridgeService friService;
	
	@RequestMapping("/fridge/refMain.do")
	public String refMain(HttpSession session, Model model) throws FridgeException{
		
		Member m = (Member)session.getAttribute("m");
		
		if(m == null) throw new FridgeException("로그인 정보 없음!!!");
		
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

	@RequestMapping(value="/fridge/updateComplete.do")
	public String updateComplete(HttpSession session, Model model, @RequestParam(value="inRef", required=false, defaultValue="") String inRef) throws FridgeException{
		
		Member m = (Member)session.getAttribute("m");
		
		if(m == null) throw new FridgeException("로그인 정보 없음!!!");
		
		friService.updateComplete(inRef, m.getmNum(), m.getmName(), m.getmId());
		
		List<Fridge> list = friService.checkFridge(m.getmNum());
		
		model.addAttribute("list", list);
		
		return "fridge/refMain";
	}

	
	
}
