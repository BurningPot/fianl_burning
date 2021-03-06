package com.kh.pot.recipe.model.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.pot.board.model.vo.Report;
import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.recipe.model.vo.Recipe;
import com.kh.pot.recipe.model.vo.RecipeContent;
import com.kh.pot.recipe.model.vo.Recommend;
import com.kh.pot.recipe.model.vo.Review;

public interface RecipeDao {
	
	List<Ingredient> selectCategoryList();

	List<Ingredient> selectIngredientList(String category);

	int insertRecipe(Recipe recipe);

	int insertRecipeContent(RecipeContent recipeContent);

	String renameFile(MultipartFile file);

	Recipe selectRecipeDetail(int rNum);

	Ingredient selectMainIngredientList(String mainName);

	List<RecipeContent> selectContentList(int rNum);

	int deleteRecipeContent(int rNum);

	int deleteRecipe(int rNum);

	int updateCount(int rNum);

//	List<Review> selectReview(int rNum);

	Recommend selectRecommend(Recommend rec);

	int insertRecommned(Recommend rec);

	int updateRecommend(Recommend rec);

	int deleteRecommned(Recommend rec);

	int insertReview(Review review);

	int insertReport(Report report);

	Review selectReviewOne(Review rv);

	int deleteReview(int rvNum);

	double reviewAvgGrade(int rNum);

	int selectReviewTotalContents(int rNum);

	List<Map<String, String>> selectReview(Map<String, Object> map);

	int updateRecipe(Recipe recipe);

	int deleteReviewAll(int rNum);

	List<String> selectFridgeList(int mNum);

}