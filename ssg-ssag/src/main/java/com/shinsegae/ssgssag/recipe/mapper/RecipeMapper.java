package com.shinsegae.ssgssag.recipe.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shinsegae.ssgssag.recipe.vo.RecipeVO;

@Mapper
public interface RecipeMapper {
	
	// 등록
	int recipeInsert(RecipeVO param);
		
	// 조회
	RecipeVO selectOne(int recipe_id);
	List<RecipeVO> selectList();
}
