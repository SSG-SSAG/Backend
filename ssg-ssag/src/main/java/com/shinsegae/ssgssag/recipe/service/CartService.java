package com.shinsegae.ssgssag.recipe.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinsegae.ssgssag.recipe.mapper.CartMapper;
import com.shinsegae.ssgssag.recipe.vo.CartVO;

@Service
public class CartService {
	
	@Autowired
	CartMapper mapper;
	
	public List<String> getRefg(String user_id) {
		List<String> obj = mapper.getRefg(user_id);
		return obj;
	}
	
	public List<CartVO> getIngs(String user_id) {
		List<CartVO> obj = mapper.getIngs(user_id);
		for ( int i = 0; i<obj.size(); i++) {
			obj.get(i).setIng_name(mapper.getName(obj.get(i).getIng_id()));
		}
		
		return obj;
	}
	
	public List<CartVO> rcpIngs(String recipe_id) {
		List<CartVO> obj = mapper.rcpIngs(recipe_id);
		return obj;
	}
	
	public int addIngs(String user_id, String ing_id) {
		LocalDate now = LocalDate.now();
		int r = mapper.addIngs(user_id, ing_id, now);
		return 1;
	}
	
	public boolean deleteCart(String user_id, int ing_id) {
		int r = mapper.deleteCart(user_id, ing_id);
		
		if (r == 1) {
			return true;
		}
		return false;
	}
	
	public boolean deleteAll(String user_id) {
		int r = mapper.deleteAll(user_id);
		System.out.println(r);
		return true;
	}
}
