package com.kh.pot.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.member.model.vo.Member;
import com.kh.pot.recipe.model.service.RecipeService;
import com.kh.pot.recipe.model.vo.Recipe;
import com.kh.pot.recipe.model.vo.RecipeContent;

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
	@RequestMapping(value = "recipe/insertRecipe.do",  method=RequestMethod.POST)
	public String insertRecipe(Recipe recipe,
													@RequestParam("rContent") String[] rContent,
													@RequestParam(value="rImgFile", required=false) MultipartFile file,
													@RequestParam(value="rContentimg", required=false) MultipartFile[] files,
													HttpServletRequest request,
													Model model) {		
		String loc = "/";
		String msg = "";
		int result = 0;
		System.out.println(recipe);
		
		// 파일 저장 경로 생성
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/img/recipeContent");
		File dir = new File(saveDir);
		
		// 만약 저장 경로에 폴더가 없을 경우 폴더 생성
		if (!dir.exists()) {
			System.out.println("dir.mkdirs() = " + dir.mkdirs());
		}
		
		if (!file.isEmpty()) {
			recipe.setrImg(recipeService.renameFile(file));
			
			result = recipeService.insertRecipe(recipe);
			
			try {
				file.transferTo(new File(saveDir + "/" + recipe.getrImg()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		if (result > 0) {
			result = 0;
			int index = 0;
			
			for(MultipartFile f : files) {
				if (!f.isEmpty()) {
					String renameFileName = recipeService.renameFile(f);
					
					RecipeContent recipeContent = new RecipeContent((index + 1), recipe.getrNum(), rContent[index], renameFileName);
					
					if (recipeService.insertRecipeContent(recipeContent) == 1) {
						result += 1;
						index += 1;
						
						try {
							f.transferTo(new File(saveDir + "/" + renameFileName));
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
			
			if (result == rContent.length) {
				msg = "레시피 작성 성공!";
			}
		} else {
			msg = "레시피 작성 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	// 레시피 상세보기 페이지
	@RequestMapping("/recipe/recipeDetail.do")
	public String goRecipeDetail(@RequestParam("rNum") int rNum,
														Model model) throws Exception {
		String page = "";
		Recipe recipe = recipeService.selectRecipeDetail(rNum);
		
		if (recipe != null) {			
			String[] subList = recipe.getSubIngredient().split(",");
			String[] mainName = recipe.getiNum().split(",");
			String[] mainQuan = recipe.getiQuan().split(",");
			List<Ingredient> mainNameList = null;
			List<RecipeContent> contentList = null;
			
			mainNameList = recipeService.selectMainIngredientList(mainName);
			contentList = recipeService.selectContentList(recipe.getrNum());
			
			if (mainNameList != null && contentList != null) {
				page = "recipe/recipeDetail";
				model.addAttribute("recipe", recipe);
				model.addAttribute("subList", subList);
				model.addAttribute("mainQuan", mainQuan);
				model.addAttribute("mainNameList", mainNameList);
				model.addAttribute("contentList", contentList);
			} else {
				throw new Exception("레시피 조회 도중 문제가 발생하였습니다.");
			}
		} else {
			throw new Exception("해당 레시피 정보를 찾을 수 없습니다.");
		}
		
		return page;
	}
	
	// 레시피 수정 페이지
	@RequestMapping("/recipe/selectDetail.do")
	public String goUpdateForm(@RequestParam("rNum") int rNum,
														Model model) throws Exception {
		String page = "";
		Recipe recipe = recipeService.selectRecipeDetail(rNum);
		
		System.out.println("데이터 확인 : " + rNum);
		if (recipe != null) {			
			String[] subList = recipe.getSubIngredient().split(",");
			String[] mainNum = recipe.getiNum().split(",");
			String[] mainQuan = recipe.getiQuan().split(",");
			List<Ingredient> mainNameList = null;
			List<RecipeContent> contentList = null;
			List<Ingredient> list = recipeService.selectCategoryList();
			
			mainNameList = recipeService.selectMainIngredientList(mainNum);
			contentList = recipeService.selectContentList(recipe.getrNum());
			
			if (mainNameList != null && contentList != null && list.size() > 0) {
				page = "recipe/recipeUpdateForm";
				model.addAttribute("recipe", recipe);
				model.addAttribute("subList", subList);
				model.addAttribute("mainQuan", mainQuan);
				model.addAttribute("mainNameList", mainNameList);
				model.addAttribute("mainNum", mainNum);
				model.addAttribute("contentList", contentList);
				model.addAttribute("categoryList", list);
				System.out.println("레시피 : " + recipe.getiNum());
				System.out.println(mainNum[0] + "/" + mainNum[1] + "/" + mainNum[2]);
			} else {
				throw new Exception("레시피 조회 도중 문제가 발생하였습니다.");
			}
		} else {
			throw new Exception("해당 레시피 정보를 찾을 수 없습니다.");
		}
		
		return page;
	}

}