package com.shinsegae.ssgssag.recipe.service;

import java.time.LocalDate;
import java.util.ArrayList;
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
	
	public List<RecipeVO> ref(RecipeVO vo) {
		System.out.println("가가가가가가");
		System.out.println(vo);
		List<RecipeVO> obj = mapper.selectRef(vo);
		for ( int i = 0; i<obj.size(); i++) {
			System.out.println(obj.get(i).getIng_id());
		}
		return obj;
	}
	
	public int addone(String ing_id, String user_id) {
		LocalDate now = LocalDate.now();
		int r = mapper.addone(ing_id, user_id, String.valueOf(now));
		return r;
	}
	
	public List<String> getCart(RecipeVO vo) {
		
		List<String> obj = mapper.getCart(vo.getUser_id());
		return obj;
	}
}
