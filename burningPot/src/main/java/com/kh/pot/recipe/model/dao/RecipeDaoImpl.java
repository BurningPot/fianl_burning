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
	public List<Ingredient> selectMainIngredientList(Map mainName) {

		return sqlSession.selectList("recipe.selectMainIngredientList", mainName);
		
	}

	@Override
	public List<RecipeContent> selectContentList(int rNum) {

		return sqlSession.selectList("recipe.selectContentList", rNum);
		
	}

}