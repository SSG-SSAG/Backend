package com.shinsegae.ssgssag.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinsegae.ssgssag.recipe.mapper.RecipeMapper;
import com.shinsegae.ssgssag.recipe.vo.RecipeVO;

@Service
public class RecipeService {

	@Autowired
	RecipeMapper mapper;
	
	// 레시피 이름 조회
	public List<RecipeVO> reci(RecipeVO vo) {
		System.out.println("### Recipe Service ###");
		System.out.println(vo.getRname());
		List<RecipeVO> obj = mapper.selectList(vo);
		
		System.out.println("### obj ### " + obj.get(0));
		return obj;
	}
	
	// 레시피 재료 조회
	public List<RecipeVO> ingre(RecipeVO vo) {
		System.out.println("### Ingredient Service ###");
		
		List<RecipeVO> obj = mapper.selectIngre(vo);
		
		System.out.println("### obj ### " + obj.get(0));
		return obj;
	}
}
