package com.shinsegae.ssgssag.recipe.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shinsegae.ssgssag.recipe.vo.RecipeVO;

@Mapper
public interface RecipeMapper {
	
	// ���
	int recipeInsert(RecipeVO param);
		
	// ��ȸ
	RecipeVO selectOne(int recipe_id);
	List<RecipeVO> selectList();
}
