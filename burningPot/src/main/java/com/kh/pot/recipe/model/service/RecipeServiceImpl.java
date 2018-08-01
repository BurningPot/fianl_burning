package com.kh.pot.recipe.model.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.pot.board.model.vo.Report;
import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.recipe.model.dao.RecipeDao;
import com.kh.pot.recipe.model.vo.Recipe;
import com.kh.pot.recipe.model.vo.RecipeContent;
import com.kh.pot.recipe.model.vo.Recommend;
import com.kh.pot.recipe.model.vo.Review;

@Service
public class RecipeServiceImpl implements RecipeService {
	
	@Autowired
	RecipeDao recipeDao;

	@Override
	public List<Ingredient> selectCategoryList() {
		
		return recipeDao.selectCategoryList();
		
	}

	@Override
	public List<Ingredient> selectIngredientList(String category) {

		return recipeDao.selectIngredientList(category);
		
	}

	@Override
	public int insertRecipe(Recipe recipe) {

		return recipeDao.insertRecipe(recipe);
	}

	@Override
	public int insertRecipeContent(RecipeContent recipeContent) {

		return recipeDao.insertRecipeContent(recipeContent);
		
	}

	@Override
	public String renameFile(MultipartFile file) {

		return recipeDao.renameFile(file);
		
	}

	@Override
	public Recipe selectRecipeDetail(int rNum) {

		return recipeDao.selectRecipeDetail(rNum);
		
	}

	@Override
	public Ingredient selectMainIngredientList(String mainName) {

		return recipeDao.selectMainIngredientList(mainName);
		
	}

	@Override
	public List<RecipeContent> selectContentList(int rNum) {

		return recipeDao.selectContentList(rNum);
		
	}

	@Override
	public int deleteRecipeContent(int rNum) {

		return recipeDao.deleteRecipeContent(rNum);
		
	}

	@Override
	public int deleteRecipe(int rNum) {

		return recipeDao.deleteRecipe(rNum);
		
	}

	@Override
	public int updateCount(int rNum) {

		return recipeDao.updateCount(rNum);
		
	}

//	@Override
//	public List<Review> selectReview(int rNum) {
//
//		return recipeDao.selectReview(rNum);
//		
//	}

	@Override
	public Recommend selectRecommend(Recommend rec) {

		return recipeDao.selectRecommend(rec);
		
	}

	@Override
	public int insertRecommned(Recommend rec) {

		return recipeDao.insertRecommned(rec);
		
	}

	@Override
	public int updateRecommend(Recommend rec) {

		return recipeDao.updateRecommend(rec);
		
	}

	@Override
	public int deleteRecommned(Recommend rec) {

		return recipeDao.deleteRecommned(rec);
		
	}

	@Override
	public int insertReview(Review review) {

		return recipeDao.insertReview(review);
		
	}

	@Override
	public int insertReport(Report report) {

		return recipeDao.insertReport(report);
		
	}

	@Override
	public Review selectReviewOne(Review rv) {

		return recipeDao.selectReviewOne(rv);
		
	}

	@Override
	public int deleteReview(int rvNum) {

		return recipeDao.deleteReview(rvNum);
		
	}

	@Override
	public double reviewAvgGrade(int rNum) {

		return recipeDao.reviewAvgGrade(rNum);
		
	}

	@Override
	public int selectReviewTotalContents(int rNum) {

		return recipeDao.selectReviewTotalContents(rNum);
		
	}

	@Override
	public List<Map<String, String>> selectReview(int rNum, int currentPage, int numPerPage) {

		int startRow = (currentPage - 1) * numPerPage+1;
		int endRow = startRow + (numPerPage-1);
		System.out.println("startrow : " + startRow);
		System.out.println("endRow : " + endRow);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rNum", rNum);
		map.put("startRow", startRow);
		map.put("endRow",endRow);
		
		return recipeDao.selectReview(map);
		
	}

	@Override
	public int updateRecipe(Recipe recipe) {

		return recipeDao.updateRecipe(recipe);
		
	}

	@Override
	public int deleteReviewAll(int rNum) {

		return recipeDao.deleteReviewAll(rNum);
		
	}

}