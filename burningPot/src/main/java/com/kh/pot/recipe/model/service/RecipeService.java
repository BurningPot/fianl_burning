package com.kh.pot.recipe.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.pot.board.model.vo.Report;
import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.recipe.model.vo.Recipe;
import com.kh.pot.recipe.model.vo.RecipeContent;
import com.kh.pot.recipe.model.vo.Recommend;
import com.kh.pot.recipe.model.vo.Review;

public interface RecipeService {

	// 레시피 등록 페이지 접속 시 주재료 카테고리 조회 서비스
	List<Ingredient> selectCategoryList();

	// 카테고리 선택 시 관련 식재료 조회 서비스
	List<Ingredient> selectIngredientList(String category);

	// 레시피 등록 서비스
	int insertRecipe(Recipe recipe);

	// 레시피 내용 등록 서비스
	int insertRecipeContent(RecipeContent recipeContent);

	// 이미지 파일 명칭 변경 서비스
	String renameFile(MultipartFile file);

	// 레시피 상세보기 서비스
	Recipe selectRecipeDetail(int rNum);

	// 식재료 명칭 조회 서비스
	Ingredient selectMainIngredientList(String mainName);

	// 해당 레시피 요리 순서 조회 서비스
	List<RecipeContent> selectContentList(int rNum);

	// 해당 레시피 요리 순서 삭제 서비스
	int deleteRecipeContent(int rNum);

	// 레시피 삭제 서비스
	int deleteRecipe(int rNum);

	// 레시피 조회 시 조회수 증가 서비스
	int updateCount(int rNum);

	// 해당 레시피 리뷰 조회 서비스
//	List<Review> selectReview(int rNum);

	// 해당 레시피 좋아요 여부 확인 서비스
	Recommend selectRecommend(Recommend rec);

	// 사용자 좋아요 추가 서비스
	int insertRecommned(Recommend rec);

	// 해당 레시피 좋아요 증가/감소 서비스
	int updateRecommend(Recommend rec);

	// 사용자 좋아요 삭제 서비스
	int deleteRecommned(Recommend rec);

	// 댓글 작성 서비스
	int insertReview(Review review);

	// 신고하기 서비스
	int insertReport(Report report);

	// 작성한 댓글 정보 조회 서비스
	Review selectReviewOne(Review rv);

	// 댓글 삭제 서비스
	int deleteReview(int rvNum);

	// 상세보기 리뷰 평점 계산 서비스
	double reviewAvgGrade(int rNum);

	// 상세보기 리뷰 페이징 서비스 - 전체 리뷰 수 구하기
	int selectReviewTotalContents(int rNum);

	// 해당 레시피 리뷰 조회 서비스
	List<Map<String, String>> selectReview(int rNum, int currentPage, int numPerPage);

	// 레시피 정보 수정 서비스
	int updateRecipe(Recipe recipe);

	// 레시피 삭제 시 해당 레시피 리뷰 전체 삭제 서비스 
	int deleteReviewAll(int rNum);
	
}