package com.kh.pot.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.kh.pot.recipe.model.vo.Recommend;
import com.kh.pot.recipe.model.vo.Review;

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeService recipeService;
	
	// 레시피 작성 페이지
	@RequestMapping("/recipe/recipeForm.do")
	public String goRecipeForm(Model model) throws Exception {
		String page = "";
				
		List<Ingredient> list = recipeService.selectCategoryList();
		
		if (list.size() > 0) {
			model.addAttribute("categoryList", list);
			
			page = "recipe/recipeForm";
		} else {
			throw new Exception("잘못 된 접근입니다.");
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
														HttpSession session,
														Model model) throws Exception {
		String page = "";
		
		// 조회수 증가
		int result = recipeService.updateCount(rNum);
		Member m = (Member)session.getAttribute("m");
				
		if (result > 0) {
			Recipe recipe = recipeService.selectRecipeDetail(rNum);
			List<Review> review = recipeService.selectReview(rNum);
			
			if (recipe != null) {			
				String[] subList = recipe.getSubIngredient().split(",");
				String[] mainNum = recipe.getiNum().split(",");
				String[] mainQuan = recipe.getiQuan().split(",");
				List<Ingredient> mainNameList = new ArrayList<Ingredient>();
				List<RecipeContent> contentList = null;
				
				for (int i = 0 ; i < mainNum.length ; i++) {
					mainNameList.add(recipeService.selectMainIngredientList(mainNum[i]));
				}
				contentList = recipeService.selectContentList(recipe.getrNum());
				
				if (m != null) {
					Recommend recommend = new Recommend(m.getmNum(), rNum);
					recommend = recipeService.selectRecommend(recommend);
					
					model.addAttribute("recommend", recommend);
				}
				
				if (mainNameList != null && contentList != null) {
					page = "recipe/recipeDetail";
					model.addAttribute("recipe", recipe);
					model.addAttribute("subList", subList);
					model.addAttribute("mainQuan", mainQuan);
					model.addAttribute("mainNameList", mainNameList);
					model.addAttribute("contentList", contentList);
					model.addAttribute("review", review);
				} else {
					throw new Exception("레시피 조회 도중 문제가 발생하였습니다.");
				}
			} else {
				throw new Exception("해당 레시피 정보를 찾을 수 없습니다.");
			}
		} else {
			throw new Exception("조회수 오류 발생");
		}
		
		return page;
	}
	
	// 레시피 수정 페이지
	@RequestMapping("/recipe/selectDetail.do")
	public String goUpdateForm(@RequestParam("rNum") int rNum,
														Model model) throws Exception {
		String page = "";
		Recipe recipe = recipeService.selectRecipeDetail(rNum);

		if (recipe != null) {			
			String[] subList = recipe.getSubIngredient().split(",");
			String[] mainNum = recipe.getiNum().split(",");
			String[] mainQuan = recipe.getiQuan().split(",");
			List<Ingredient> mainNameList = new ArrayList<Ingredient>();
			List<RecipeContent> contentList = null;
			List<Ingredient> list = recipeService.selectCategoryList();
						
			contentList = recipeService.selectContentList(recipe.getrNum());

			for (int i = 0 ; i < mainNum.length ; i++) {
				mainNameList.add(recipeService.selectMainIngredientList(mainNum[i]));
			}
			
			if (mainNameList != null && contentList != null && list.size() > 0) {
				page = "recipe/recipeUpdateForm";
				model.addAttribute("recipe", recipe);
				model.addAttribute("subList", subList);
				model.addAttribute("mainQuan", mainQuan);
				model.addAttribute("mainNameList", mainNameList);
				model.addAttribute("mainNum", mainNum);
				model.addAttribute("contentList", contentList);
				model.addAttribute("categoryList", list);
			} else {
				throw new Exception("레시피 조회 도중 문제가 발생하였습니다.");
			}
		} else {
			throw new Exception("해당 레시피 정보를 찾을 수 없습니다.");
		}
		
		return page;
	}
	
	// 레시피 수정 - DB 수정
	@RequestMapping("/recipe/updateRecipe.do")
	public String updateRecipe(Recipe recipe,
													@RequestParam("rContent") String[] rContent,
													@RequestParam(value="rImgFile", required=false) MultipartFile file,
													@RequestParam(value="rContentimg", required=false) MultipartFile[] files,
													HttpServletRequest request,
													Model model) {
		String page = "";
		String deleteDir = request.getSession().getServletContext().getRealPath("/resources/img/recipeContent");
		
		File deleteFile = new File(deleteDir + "/20180722_133519_100.PNG");
		
		if (deleteFile.exists()) {
			if (deleteFile.delete()) {
				System.out.println("파일 삭제 성공");
			} else {
				System.out.println("파일 삭제 실패");
			}
		}
			
		
		return page;
	}
	
	// 레시피 수정 - DB 삭제
	@RequestMapping("/recipe/deleteRecipe.do")
	public String deleteRecipe(@RequestParam("rNum") int rNum,
														HttpServletRequest request,
														Model model) throws Exception {
		String page = "";
		String deleteDir = request.getSession().getServletContext().getRealPath("/resources/img/recipeContent");
		String loc = "/";
		String msg = "";
		
		// 레시피 파일 이미지명 받아오기
		List<RecipeContent> imgList = recipeService.selectContentList(rNum);
		
		if (!imgList.isEmpty()) {		// 받아온 데이터 값 확인
			if (recipeService.deleteRecipeContent(rNum) > 0) {		// DB가 지워질 경우 파일 삭제
				for (RecipeContent rc : imgList) {
					File deleteFile = new File(deleteDir + "/" + rc.getrContentimg());
					
					if (deleteFile.exists()) {
						if (deleteFile.delete()) {
						} else {
							throw new Exception("레시피 내용 삭제 도중 문제가 발생하였습니다.\r관리자에게 문의 바랍니다. (Recipe No." +  rNum + ")");
						}
					}
				}
				
				String titleImg = recipeService.selectRecipeDetail(rNum).getrImg();
				
				if (recipeService.deleteRecipe(rNum) > 0) {
					File deleteFile = new File(deleteDir + "/" + titleImg);
					
					if (deleteFile.exists()) {
						if (deleteFile.delete()) {
							page = "common/msg"; 
							msg = "레시피를 성공적으로 삭제하였습니다.";
							
							model.addAttribute("loc", loc);
							model.addAttribute("msg", msg);
						} else {
							throw new Exception("레시피 내용 삭제 도중 문제가 발생하였습니다.\r관리자에게 문의 바랍니다. (Recipe No." +  rNum + ")");
						}
					}
				}
			} else {
				throw new Exception("레시피 내용 삭제 도중 문제가 발생하였습니다.\r관리자에게 문의 바랍니다. (Recipe No." +  rNum + ")");
			}
		}
		
		return page;
	}
	
	// 레시피 상세보기 - 좋아요 
	@ResponseBody
	@RequestMapping("/recipe/insertRecommend.do")
	public int insertRecommend(@RequestParam("rNum") int rNum,
															HttpSession session) throws Exception {
		Member m = (Member)session.getAttribute("m");
		int result = 0;
		
		if (m != null) {
			Recommend rec = new Recommend(m.getmNum(), rNum, "plus");
		
			result = recipeService.insertRecommned(rec);
			
			if (result == 1) {
				result = recipeService.updateRecommend(rec);
				result = recipeService.selectRecipeDetail(rNum).getrRecommend();
				
				if (result < 1) {
					throw new Exception("좋아요 버튼 오류. (error : updateRecommend / 관리자에게 문의 바랍니다.)");
				}
			} else {
				throw new Exception("좋아요 버튼 오류. (error : insertRecommend / 관리자에게 문의 바랍니다.)");
			}
		}
		
		return result;
	}
	
	// 레시피 상세보기 - 좋아요 삭제
	@ResponseBody
	@RequestMapping("/recipe/deleteRecommend.do")
	public int deleteRecommend (@RequestParam("rNum") int rNum,
															HttpSession session) throws Exception {
		Member m = (Member)session.getAttribute("m");
		int result = 0;
		
		if (m != null) {
			Recommend rec = new Recommend(m.getmNum(), rNum, "minus");
			
			result = recipeService.deleteRecommned(rec);
			
			if (result == 1) {
				result = recipeService.updateRecommend(rec);
				result = recipeService.selectRecipeDetail(rNum).getrRecommend();
				
				if (result < 1) {
					throw new Exception("좋아요 버튼 오류. (error : updateRecommend / 관리자에게 문의 바랍니다.)");
				}
			} else {
				throw new Exception("좋아요 버튼 오류. (error : insertRecommend / 관리자에게 문의 바랍니다.)");
			}
		}
		
		return result;
	}
	
	// 레시피 상세보기 - 댓글 작성
	@ResponseBody
	@RequestMapping("/recipe/insertReview.do")
	public Review insertReview(Review review,
														Model model,
														HttpSession session) throws Exception {
		Review rv = null;
		Member m = (Member)session.getAttribute("m");
		
		if (m != null) {
			System.out.println(review);
			if (recipeService.insertReview(review) == 1) {
				rv = review;
			} else {
				throw new Exception("댓글 등록 오류 (error : insertReview / 관리자에게 문의 바랍니다.)");
			}
		} else {
			throw new Exception("잘못된 접근입니다. (로그인 이후 이용해 주세요.)");
		}
		
		return rv;
	}
	
	// 레시피 상세보기 - 신고하기
	@ResponseBody
	@RequestMapping("/recipe/insertReport.do")
	public int insertReport() {
		int result = 0;
		
		
		
		return result;
	}

}