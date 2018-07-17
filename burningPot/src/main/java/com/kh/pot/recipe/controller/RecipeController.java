package com.kh.pot.recipe.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.recipe.model.service.RecipeService;
import com.kh.pot.recipe.model.vo.Recipe;
import com.kh.pot.recipe.model.vo.RecipeContent;

@SessionAttributes(value={"member"})

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeService recipeService;
	
	// 레시피 작성 페이지
	@RequestMapping("/recipe/recipeForm.do")
	public String goRecipeForm(Model model) {
		String page = "";
		
		List<Ingredient> list = recipeService.selectCategoryList();
		
		if (list.size() > 0) {
			model.addAttribute("categoryList", list);
			
			page = "recipe/recipeForm";
		} else {
			
		}
		
		return page;
	}
	
	// 레시피 작성 - 주재료 카테고리 선택 시 식재료 조회 서비스 호출
	@ResponseBody
	@RequestMapping("recipe/selectIngredientList.do")
	public List<Ingredient> selectIngredient(@RequestParam("category") String category) {		
		List<Ingredient> list = recipeService.selectIngredientList(category);
						
		return list;
	}
	
	// 레시피 작성 - DB에 데이터 저장
	@RequestMapping("recipe/insertRecipe.do")
	public String insertRecipe(Recipe recipe, RecipeContent rContent) {
		System.out.println("recipe/insertRecipe.do recipe 데이터 확인 : " + recipe);
		System.out.println("recipe/insertRecipe.do rContent 데이터 확인 : " + rContent);
		
		return "redirect:/";
	}

}