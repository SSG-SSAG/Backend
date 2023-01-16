package com.shinsegae.ssgssag.recipe.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinsegae.ssgssag.recipe.mapper.RecipeLikeMapper;
import com.shinsegae.ssgssag.recipe.mapper.RecipeMapper;
import com.shinsegae.ssgssag.recipe.vo.RecipeLikeVO;
import com.shinsegae.ssgssag.recipe.vo.RecipeVO;

@Service
public class RecipeService {

	@Autowired
	RecipeMapper mapper;
	@Autowired
	RecipeLikeMapper likeMapper;
	
	// 레시피 이름 조회
	public List<RecipeVO> reci(RecipeVO vo) {
		System.out.println("### Recipe Service ###");
		List<RecipeVO> obj = mapper.selectList(vo);
		return obj;
	}
	
	// 레시피 재료 조회
	public List<RecipeVO> ingre(RecipeVO vo) {
		System.out.println("### Ingredient Service ###");
		
		List<RecipeVO> obj = mapper.selectIngre(vo);
		
		System.out.println("### obj ### " + obj.get(0));
		return obj;
	}

	public List<RecipeVO> rcp_page(RecipeVO vo) {
		List<RecipeVO> obj = mapper.rcp_page(vo);
		return obj;
	}	
	
	// 레시피 태그 조회
	public List<RecipeVO> rcp_tag(RecipeVO vo) {
		List<RecipeVO> obj = mapper.rcp_tag(vo);
		System.out.println("rcp_tag : " + obj);
		
		return obj;
	}
	
	// 레시피 좋아요 테이블 조회
	public RecipeLikeVO isLiked(int recipe_id, int user_no) {
		
		// 2개의 파라미터를 map에 담아서
		Map<String, Integer> data = new HashMap<String, Integer>();
		data.put("recipe_id", recipe_id);
		data.put("user_no", user_no);
		
		// mapper로 보내기
		RecipeLikeVO recipeLike = likeMapper.isRecipeLiked(data);
		
		return recipeLike;
	}
	
	// 레시피 좋아요 처리
	public int insertLike(RecipeLikeVO recipeLikeVO) {
		// 기본 값 설정
		int result = 0;
		
		// 좋아요 한 적 있는지 확인하기
		Map<String, Integer> data = new HashMap<String, Integer>();
		data.put("recipe_id", recipeLikeVO.getRecipe_id());
		data.put("user_no", recipeLikeVO.getUser_no());
		RecipeLikeVO recipeLike = likeMapper.isRecipeLiked(data);
		
		if (recipeLike == null) {
			// 좋아요 한 적 없군요 좋아요 처리 해드릴게요!
			result = likeMapper.insertRecipeLike(recipeLikeVO);
		} else {
			// 좋아요 한 적 있네요 좋아요 취소 처리 해드릴게요!
			likeMapper.deleteRecipeLike(recipeLikeVO); 
		}
		return result;
	}
}

