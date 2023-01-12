package com.shinsegae.ssgssag.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinsegae.ssgssag.recipe.mapper.CartMapper;
import com.shinsegae.ssgssag.recipe.vo.CartVO;

@Service
public class CartService {
	
	@Autowired
	CartMapper mapper;
	
	public List<CartVO> getIngs(String user_id) {
		List<CartVO> obj = mapper.getIngs(user_id);
		for ( int i = 0; i<obj.size(); i++) {
			obj.get(i).setIng_name(mapper.getName(obj.get(i).getIng_id()));
		}
		
		return obj;
	}
}
