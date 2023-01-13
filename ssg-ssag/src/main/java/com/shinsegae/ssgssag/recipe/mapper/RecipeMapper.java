package com.shinsegae.ssgssag.recipe.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shinsegae.ssgssag.recipe.vo.RecipeVO;

@Mapper
public interface RecipeMapper {
	
	// ���
	int recipeInsert(RecipeVO param);
		
	// ������ �̸����� ��ȸ
	List<RecipeVO> selectList(RecipeVO vo);

	// ������ ���� ��ȸ
	List<RecipeVO> selectIngre(RecipeVO vo);
	
	// ������ ��� ��ȸ
	List<RecipeVO> getIngs(RecipeVO vo);
	
	// ������ ���� ���� ��ȸ
	List<RecipeVO> getSteps(RecipeVO vo);
	
	// ������ ��� �� ��ȸ
	List<RecipeVO> selectIngs(RecipeVO vo);
	
	// For paging
	List<RecipeVO> rcp_page(RecipeVO vo);
}
