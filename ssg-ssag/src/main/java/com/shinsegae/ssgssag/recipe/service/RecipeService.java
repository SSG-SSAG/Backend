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
	
	// ��ü ��ȸ
	public List<RecipeVO> all() {
		System.out.println("### Service ###");
		
		List<RecipeVO> obj = mapper.selectList();
		return obj;
	}
}