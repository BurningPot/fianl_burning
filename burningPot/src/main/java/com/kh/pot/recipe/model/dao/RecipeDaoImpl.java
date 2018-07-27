package com.kh.pot.recipe.model.dao;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

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
		System.out.println("타이틀 : " + renameFileName);
		
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
	public List<Review> selectReview(int rNum) {

		return sqlSession.selectList("recipe.selectReview", rNum);
		
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
		Recipe recipe = null;
		
		if (sqlSession.update("recipe.updateRecommend", rec) == 1) {
			recipe = sqlSession.selectOne("recipe.selectRecipeDetail", rec);
		};
		
		return recipe.getrRecommend();
		
	}

	@Override
	public int deleteRecommned(Recommend rec) {

		return sqlSession.delete("recipe.deleteRecommned", rec);
		
	}

	@Override
	public int insertReview(Review review) {

		return sqlSession.insert("recipe.insertReview", review);
		
	}

}