package com.kh.pot.recipe.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.kh.pot.admin.model.vo.PageInfo;
import com.kh.pot.board.model.vo.Report;
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
		
		// 타이틀 이미지 업로드
		if (!file.isEmpty()) {
			recipe.setrImg(recipeService.renameFile(file));
			
			result = recipeService.insertRecipe(recipe);
			
			try {
				file.transferTo(new File(saveDir + "/" + recipe.getrImg()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		// 요리 순서 이미지 업로드
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
														@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
														@RequestParam(value="searchReview", required=false, defaultValue="null") String searchReview,
														@RequestParam(value="keyword", required=false, defaultValue="null") String keyword,
														HttpSession session,
														Model model) throws Exception {
		String page = "";
		
		// 조회수 증가
		int result = recipeService.updateCount(rNum);
		Member m = (Member)session.getAttribute("m");
		System.out.println("키워드 : " +keyword);
		
		// ------------------------ 페이징 처리 [START] ------------------------
		int startPage; 	// 한번에 표시될 게시글들의 시작 페이지
		int endPage;	// 한번에 표시될 게시글들의 마지막 페이지
		int maxPage;	// 전체 페이지의 마지막 페이지
		int numPerPage = 5;  	//한 페이지당 게시글 수
		
		if (currentPage == 0) {
			currentPage = 1;
		}
		
		// 전체 게시글 수 구하기
		int totalReview = recipeService.selectReviewTotalContents(rNum);
		
		maxPage = (int)((double)totalReview / numPerPage + 0.9);
		
		// 첫 페이지의 번호
		// ex) 한 화면에 10개의 페이지를 표시하는 경우 
		startPage =(((int)((double)currentPage / numPerPage + 0.9))-1)*numPerPage +1;
		
		// 한 화면에 표시할 마지막 페이지 번호
		endPage = startPage + numPerPage -1;
		
		// 10페이지 까지 내용이 안 찰 경우
		if(maxPage <endPage) {
			endPage=maxPage;
		}
		
		System.out.println("현재 페이지 : " + currentPage);
		System.out.println("전체 게시글 수 : " + totalReview);
		System.out.println("시작 : " + startPage);
		System.out.println("끝 : " + endPage);
		System.out.println("총 페이지 수 : " + maxPage);
		
		PageInfo pi = new PageInfo(currentPage, totalReview, numPerPage, startPage, endPage, maxPage);
		model.addAttribute("pi", pi);
		// ------------------------ 페이징 처리 [END] ------------------------
				
		if (result > 0) {
			Recipe recipe = recipeService.selectRecipeDetail(rNum);
//			List<Review> review = recipeService.selectReview(rNum);
			List<Map<String, String>> review = recipeService.selectReview(rNum, currentPage, numPerPage);
			
			if (recipe != null) {			
				String[] subList = recipe.getSubIngredient().split(",");
				String[] mainNum = recipe.getiNum().split(",");
				String[] mainQuan = recipe.getiQuan().split(",");
				List<Ingredient> mainNameList = new ArrayList<Ingredient>();
				List<RecipeContent> contentList = null;
				double avgGrade = recipeService.reviewAvgGrade(rNum);
				
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
					model.addAttribute("avg", avgGrade);
					model.addAttribute("keyword", keyword);
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
													@RequestParam("originTitleImg") String originTitleImg,
													@RequestParam("originSubImg") String[] originSubImg,
													HttpServletRequest request,
													Model model) throws Exception {
		String loc = "/";
		String msg = "";
		int result = 0;
		
		int index = 0;
		List<RecipeContent> contentList = recipeService.selectContentList(recipe.getrNum());	// 기존 이미지 리스트 받기
		String titleImg = recipeService.selectRecipeDetail(recipe.getrNum()).getrImg();		// 기존 타이틀 이미지 명 받기
		
		// 파일 저장 경로 생성
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/img/recipeContent");
		File dir = new File(saveDir);
		
		// 만약 저장 경로에 폴더가 없을 경우 폴더 생성
		if (!dir.exists()) {
			System.out.println("dir.mkdirs() = " + dir.mkdirs());
		}
		
		// 대표 이미지 받고, 업로드
		if (file.isEmpty()) {
			File fileImg = new File(saveDir + "/" + originTitleImg);
			MultipartFile mf = fileToMultipartFile(fileImg);	// file형식 이미지명 multipartfile로 변경
			
			recipe.setrImg(recipeService.renameFile(mf));
			System.out.println(recipe);
			
			result = recipeService.updateRecipe(recipe);
			
			try {
				mf.transferTo(new File(saveDir + "/" + recipe.getrImg()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		} else {
			recipe.setrImg(recipeService.renameFile(file));
			
			result = recipeService.updateRecipe(recipe);
			
			try {
				file.transferTo(new File(saveDir + "/" + recipe.getrImg()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		// 요리순서 이미지 받고, 업로드
		if (result > 0) {
			result = 0;
			
			if (recipeService.deleteRecipeContent(recipe.getrNum()) > 0) {
				for (MultipartFile f : files) {
					if (f.isEmpty()) {
						File fileImg = new File(saveDir + "/" + originSubImg[index]);
						
						MultipartFile mf = fileToMultipartFile(fileImg);
						
						String renameFileName = recipeService.renameFile(mf);
						RecipeContent recipeContent = new RecipeContent((index + 1), recipe.getrNum(), rContent[index], renameFileName);
						
						if (recipeService.insertRecipeContent(recipeContent) == 1) {
							result += 1;
							
							try {
								mf.transferTo(new File(saveDir + "/" + renameFileName));
								System.out.println(mf.getOriginalFilename() + " ---> " + renameFileName);
							} catch (IllegalStateException | IOException e) {
								e.printStackTrace();
							}
						}
						index++;
					} else {
						String renameFileName = recipeService.renameFile(f);
						RecipeContent recipeContent = new RecipeContent((index + 1), recipe.getrNum(), rContent[index], renameFileName);
						
						if (recipeService.insertRecipeContent(recipeContent) == 1) {
							result += 1;
							
							try {
								f.transferTo(new File(saveDir + "/" + renameFileName));
								System.out.println(f.getOriginalFilename() + " ---> " + renameFileName);
							} catch (IllegalStateException | IOException e) {
								e.printStackTrace();
							}
						}
						index++;
					}
				}
			}
			
			if (result == rContent.length) {
				msg = "레시피 수정 성공!";
			}
		} else {
			msg = "레시피 수정 실패!";
		}
		
		// 기존 이미지 및 데이터 삭제
		if (!contentList.isEmpty()) {		// 받아온 데이터 값 확인
			for (RecipeContent rc : contentList) {
				File deleteFile = new File(saveDir + "/" + rc.getrContentimg());
				System.out.println("이미지 확인 : " + rc.getrContentimg());
				System.out.println("이미지 확인 : " + deleteFile.getAbsolutePath());
				
				if (deleteFile.exists()) {
					if (deleteFile.delete()) {
					} else {
						deleteFile.deleteOnExit();
//						throw new Exception("레시피 수정 도중 문제가 발생하였습니다.\r관리자에게 문의 바랍니다. (Recipe No." +  recipe.getrNum() + " / originImgDel)");
					}
				}
			}
			
			File deleteFile = new File(saveDir + "/" + titleImg);
			if (deleteFile.exists()) {
				if (deleteFile.delete()) {
				} else {
					throw new Exception("레시피 내용 삭제 도중 문제가 발생하였습니다.\r관리자에게 문의 바랍니다. (Recipe No." +  recipe.getrNum() + "/ originTitleImgDel)");
				}
			}
			loc = "/recipe/recipeDetail.do?rNum=" + recipe.getrNum();
			msg = "레시피를 수정하였습니다.";
		}

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";			
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
				if (result < 1) {
					throw new Exception("좋아요 버튼 오류. (error : updateRecommend / 관리자에게 문의 바랍니다.)");
				}
				
				result = recipeService.selectRecipeDetail(rNum).getrRecommend();
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
				System.out.println("update : " + result);
				if (result < 1) {
					throw new Exception("좋아요 버튼 오류. (error : updateRecommend / 관리자에게 문의 바랍니다.)");
				}
				
				result = recipeService.selectRecipeDetail(rNum).getrRecommend();
				System.out.println("update : " + result);
			} else {
				throw new Exception("좋아요 버튼 오류. (error : insertRecommend / 관리자에게 문의 바랍니다.)");
			}
		}
		
		return result;
	}
	
	// 레시피 상세보기 - 댓글 작성
	@RequestMapping("/recipe/insertReview.do")
	public String insertReview(Review review,
													@RequestParam(value="maxPage", required=false, defaultValue="1") int maxPage,
													Model model,
													HttpSession session) throws Exception {
		String msg="";
		String loc ="/recipe/recipeDetail.do";
		Member m = (Member)session.getAttribute("m");
		
		System.out.println("리뷰 확인 : " + review);
		
		if (m != null) {
			if (recipeService.insertReview(review) == 1) {
				msg="댓글 등록 완료";
				return "redirect:/recipe/recipeDetail.do?rNum="+review.getrNum()+"&keyword=review&currentPage="+maxPage;
			} else {
				msg="댓글 등록 실패";
			}
		} else {
			throw new Exception("잘못된 접근입니다. (로그인 이후 이용해 주세요.)");
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	// 레시피 상세보기 - 신고하기
   @ResponseBody
   @RequestMapping("/recipe/insertReport.do")
   public int insertReport(Report report) {
	   
      return recipeService.insertReport(report);
      
   }
   
   // 레시피 상세보기 - 댓글 삭제
   @RequestMapping("/recipe/deleteReview.do")
   public String deleteReview(@RequestParam("rvNum") int rvNum,
		   											@RequestParam("rNum") int rNum,
													@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
													Model model) throws Exception {
	   int result = recipeService.deleteReview(rvNum);
	   String msg="";
	   
	   if (result > 0) {
		   msg = "댓글 삭제 성공";
		   model.addAttribute("msg", msg);
		   return "redirect:/recipe/recipeDetail.do?rNum="+rNum+"&keyword=review&currentPage="+currentPage;
	   } else {
			throw new Exception("댓글 삭제 오류 (error : deleteReview / 관리자에게 문의 바랍니다.)");
	   }	
   }

   // MultiparfFile로 변경
   public MultipartFile fileToMultipartFile(File file) {
	    FileItem fileItem = null;
	    try {
	        fileItem = new DiskFileItem(null, Files.probeContentType(file.toPath()), false, file.getName(), (int) file.length(), file.getParentFile());
	    } catch (IOException e1) {
	        e1.printStackTrace();
	    }
	    
	    InputStream inputStream = null;
	    try {
	        inputStream = new FileInputStream(file);
	        OutputStream outputStream = fileItem.getOutputStream();
	        IOUtils.copy(inputStream, outputStream);
	        outputStream.close();
	    } catch (FileNotFoundException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    
	    MultipartFile multipartFile = new CommonsMultipartFile(fileItem);
	    
	    try {
			inputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	    
	    return multipartFile;
	}
}