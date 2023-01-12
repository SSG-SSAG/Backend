package com.shinsegae.ssgssag.recipe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shinsegae.ssgssag.recipe.service.CartService;
import com.shinsegae.ssgssag.recipe.vo.CartVO;

@Controller
public class CartController {
	
	@Autowired
	CartService service;
	
	@GetMapping("/recipe/cart.ssg")
	public String cart(@RequestParam("user_id") String user_id, HttpServletRequest req) {
		List<CartVO> obj = service.getIngs(user_id);
		for ( int i = 0; i<obj.size(); i++) {
			System.out.println(obj.get(i).getIng_name());
		}
		req.setAttribute("list", obj);
		
		return "recipe/cart";
	}
}
