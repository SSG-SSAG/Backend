package com.shinsegae.ssgssag.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.shinsegae.ssgssag.recipe.mapper.RecipeMapper;
import com.shinsegae.ssgssag.recipe.vo.RecipeVO;

public class RecipeSeviceTest {

	@Autowired
	RecipeMapper mapper;
	
	public List<RecipeVO> all() {
		System.out.println("Service");
		
		List<RecipeVO> obj = mapper.selectList();
		return obj;
	}
		
}
