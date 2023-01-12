package com.shinsegae.ssgssag.recipe.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shinsegae.ssgssag.recipe.vo.RecipeVO;

@Mapper
public interface RecipeMapper {
	
	// 등록
	int recipeInsert(RecipeVO param);
		
	// 레시피 이름으로 조회
	List<RecipeVO> selectList(RecipeVO vo);

	// 레시피 재료로 조회
	List<RecipeVO> selectIngre(RecipeVO vo);
	
	// 레시피 재료 조회
	List<String> getIngs(String recipe_id);
	
	// 레시피 조리 순서 조회
	List<String> getSteps(String recipe_id);
}
