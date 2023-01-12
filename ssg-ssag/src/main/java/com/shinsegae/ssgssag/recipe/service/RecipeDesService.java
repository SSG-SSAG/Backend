package com.shinsegae.ssgssag.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinsegae.ssgssag.recipe.mapper.RecipeMapper;

@Service
public class RecipeDesService {

	@Autowired
	RecipeMapper mapper;
	
	public List<String> getIngs(String recipe_id) {
		List<String> result = mapper.getIngs(recipe_id);
		return result;
	}
	
	public List<String> getSteps(String recipe_id) {
		List<String> result = mapper.getSteps(recipe_id);
		return result;
	}
}
