package com.shinsegae.ssgssag.recipe.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.shinsegae.ssgssag.recipe.vo.RecipeLikeVO;

@Mapper
public interface RecipeLikeMapper {

	// 찜한 레시피인지 조회한 결과
	RecipeLikeVO isRecipeLiked(RecipeLikeVO vo); 
	
	// 찜하기
	int insesrtRecipeLike(RecipeLikeVO vo);
	
	// 찜 취소
	int deleteRecipeLike(RecipeLikeVO vo);
}
