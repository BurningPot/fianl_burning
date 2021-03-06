package com.kh.pot.recipe.model.dao;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.pot.board.model.vo.Report;
import com.kh.pot.ingredient.model.vo.Ingredient;
import com.kh.pot.recipe.model.vo.Recipe;
import com.kh.pot.recipe.model.vo.RecipeContent;
import com.kh.pot.recipe.model.vo.Recommend;
import com.kh.pot.recipe.model.vo.Review;

@Repository
public class RecipeDaoImpl implements RecipeDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Ingredient> selectCategoryList() {
		
		return sqlSession.selectList("recipe.selectCategoryList");
		
	}

	@Override
	public List<Ingredient> selectIngredientList(String category) {

		return sqlSession.selectList("recipe.selectIngredientList", category);
		
	}

	@Override
	public int insertRecipe(Recipe recipe) {

		return sqlSession.insert("recipe.insertRecipe", recipe);
		
	}

	@Override
	public int insertRecipeContent(RecipeContent recipeContent) {

		return sqlSession.insert("recipe.insertRecipeContent", recipeContent);
		
	}

	@Override
	public String renameFile(MultipartFile file) {
		String originFileName = file.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		int randomNum = (int)(Math.random() * 1000);
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "_" + randomNum + "." + ext;
		
		return renameFileName;
	}

	@Override
	public Recipe selectRecipeDetail(int rNum) {

		return sqlSession.selectOne("recipe.selectRecipeDetail", rNum);
		
	}

	@Override
	public Ingredient selectMainIngredientList(String mainName) {

		return sqlSession.selectOne("recipe.selectMainIngredientList", mainName);
		
	}

	@Override
	public List<RecipeContent> selectContentList(int rNum) {

		return sqlSession.selectList("recipe.selectContentList", rNum);
		
	}

	@Override
	public int deleteRecipeContent(int rNum) {

		return sqlSession.delete("recipe.deleteRecipeContent", rNum);
		
	}

	@Override
	public int deleteRecipe(int rNum) {

		return sqlSession.delete("recipe.deleteRecipe", rNum);
		
	}

	@Override
	public int updateCount(int rNum) {

		return sqlSession.update("recipe.updateCount", rNum);
		
	}
	
	@Override
	public Recommend selectRecommend(Recommend rec) {

		return sqlSession.selectOne("recipe.selectRecommend", rec);
		
	}

	@Override
	public int insertRecommned(Recommend rec) {

		return sqlSession.insert("recipe.insertRecommned", rec);
		
	}

	@Override
	public int updateRecommend(Recommend rec) {

		return sqlSession.update("recipe.updateRecommend", rec);
		
	}

	@Override
	public int deleteRecommned(Recommend rec) {

		return sqlSession.delete("recipe.deleteRecommned", rec);
		
	}

	@Override
	public int insertReview(Review review) {

		return sqlSession.insert("recipe.insertReview", review);
		
	}

	@Override
	public int insertReport(Report report) {

		return sqlSession.insert("recipe.insertReport", report);
		
	}

	@Override
	public Review selectReviewOne(Review rv) {

		return sqlSession.selectOne("recipe.selectReviewOne", rv);
		
	}

	@Override
	public int deleteReview(int rvNum) {

		return sqlSession.delete("recipe.deleteReview", rvNum);
		
	}

	@Override
	public double reviewAvgGrade(int rNum) {
		double result = 0;
		
		if (sqlSession.selectOne("recipe.reviewAvgGrade", rNum) != null) {
			result = sqlSession.selectOne("recipe.reviewAvgGrade", rNum);
		}
		
		return result;
		
	}

	@Override
	public int selectReviewTotalContents(int rNum) {

		return sqlSession.selectOne("recipe.selectReviewTotalContents", rNum);
		
	}

	@Override
	public List<Map<String, String>> selectReview(Map<String, Object> map) {

		return sqlSession.selectList("recipe.selectReview", map);
		
	}

	@Override
	public int updateRecipe(Recipe recipe) {

		return sqlSession.update("recipe.updateRecipe", recipe);
		
	}

	@Override
	public int deleteReviewAll(int rNum) {

		return sqlSession.delete("recipe.deleteReviewAll", rNum);
		
	}

	@Override
	public List<String> selectFridgeList(int mNum) {

		return sqlSession.selectList("recipe.selectFridgeList", mNum);
	}

}