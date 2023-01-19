package com.shinsegae.ssgssag.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinsegae.ssgssag.recipe.mapper.RecipeMapper;
import com.shinsegae.ssgssag.recipe.vo.RecipeVO;

@Service
public class RecipeMyService {

	@Autowired
	RecipeMapper mapper;
	
	public List<RecipeVO> my(RecipeVO vo) {
		List<RecipeVO> obj = mapper.selectLikes(vo);
		for ( int i = 0; i<obj.size(); i++) {
			String star = "";
			for ( int j = 0; j<obj.get(i).getLevel(); j++) {
				star += "★";
				obj.get(i).setStar(star);
			}
		}
		return obj;
	}	
}
