package com.shinsegae.ssgssag.recipe.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.shinsegae.ssgssag.recipe.vo.RecipeVO;

@Mapper
public interface RecipeMapper {
	
	// 등록
	int recipeInsert(RecipeVO param);
		
	// 레시피 이름으로 조회
	List<RecipeVO> selectList(RecipeVO vo);

	// 레시피 재료로 조회
	List<RecipeVO> selectIngre(RecipeVO vo);
	
	// 태그 조회
	List<RecipeVO> selectLikes(RecipeVO vo);
	
	// 태그 조회
	List<RecipeVO> selectCats(RecipeVO vo);
	
	// 레시피 태그로 조회
	List<RecipeVO> selectTags(RecipeVO vo);
	
	// 레시피 재료 조회
	List<RecipeVO> getIngs(RecipeVO vo);
	
	// 레시피 조리 순서 조회
	List<RecipeVO> getSteps(RecipeVO vo);
	
	// 레시피 재료 상세 조회
	List<RecipeVO> selectIngs(RecipeVO vo);

	// For paging
	List<RecipeVO> rcp_page(RecipeVO vo);
	
	// 영양 성분 조회
	List<RecipeVO> selectNut(RecipeVO vo);
	
	// 냉장고 조회
	List<RecipeVO> selectRef(RecipeVO vo);
	
	// 이미지 조회
	List<RecipeVO> getImgs(RecipeVO vo);
	
	// 인기 있는 레시피 조회
	List<RecipeVO> getHotRec(RecipeVO vo);
  
	// 레시피의 태그 조회
	List<RecipeVO> rcp_tag(RecipeVO vo);
//	RecipeVO rcp_tag(RecipeVO vo);
	
	List<RecipeVO> rcpTags_page(RecipeVO vo);
	
	List<String> getTag(String recipe_id);
	
	int addone(@Param("ing_id") String ing_id, @Param("user_id") String user_id, @Param("update_date") String update_date);
	
	List<String> getCart(String user_id);
}

