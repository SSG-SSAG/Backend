package com.shinsegae.ssgssag.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinsegae.ssgssag.recipe.mapper.RecipeMapper;
import com.shinsegae.ssgssag.recipe.vo.RecipeVO;

@Service
public class RecipeDesService {

	@Autowired
	RecipeMapper mapper;
	
	public List<RecipeVO> getIngs(RecipeVO vo) {
		List<RecipeVO> obj = mapper.getIngs(vo);
		System.out.println("test");
		System.out.println(obj);
		return obj;
	}
	
	public List<RecipeVO> getSteps(RecipeVO vo) {
		List<RecipeVO> obj = mapper.getSteps(vo);
		return obj;
	}
	
	public RecipeVO getImgs(RecipeVO vo) {
		List<RecipeVO> obj = mapper.getImgs(vo);
		return obj.get(0);
	}
}
