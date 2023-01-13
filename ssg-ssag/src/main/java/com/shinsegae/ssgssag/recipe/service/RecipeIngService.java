package com.shinsegae.ssgssag.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinsegae.ssgssag.recipe.mapper.RecipeMapper;
import com.shinsegae.ssgssag.recipe.vo.RecipeVO;

@Service
public class RecipeIngService {

	@Autowired
	RecipeMapper mapper;
	
	public List<RecipeVO> ings(RecipeVO vo) {
		List<RecipeVO> obj = mapper.selectIngs(vo);
		return obj;
	}	
	
	public List<RecipeVO> nut(RecipeVO vo) {
		List<RecipeVO> obj = mapper.selectNut(vo);
		return obj;
	}	
}
