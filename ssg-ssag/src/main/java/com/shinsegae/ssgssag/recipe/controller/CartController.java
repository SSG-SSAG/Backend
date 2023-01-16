package com.shinsegae.ssgssag.recipe.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public String cart(@RequestParam("no") String user_id, @RequestParam(value="recipe_id", required=false) String recipe_id, HttpServletRequest req) {
		List<CartVO> obj = service.getIngs(user_id);
		List<String> contain_id = new ArrayList<>();
		for ( int i = 0; i<obj.size(); i++) {
			contain_id.add(obj.get(i).getIng_id());
		}
		if (recipe_id != null) {
			List<CartVO> list = service.rcpIngs(recipe_id);
			System.out.println("iii");
			for ( int i =0; i<list.size(); i++) {
				if (!contain_id.contains(list.get(i).getIng_id())) {
					int r = service.addIngs(user_id, list.get(i).getIng_id());
				}	
			}
		}
		List<CartVO> obj_final = service.getIngs(user_id);
		for ( int i = 0; i<obj_final.size(); i++) {
			if (!contain_id.contains(obj_final.get(i).getIng_id())) {
				obj_final.get(i).setIisNew(true);
			}
		}
		System.out.println("check");
		System.out.println(obj_final.size());
		req.setAttribute("list", obj_final);
		
		return "recipe/cart";
	}
	
	@GetMapping(value="/recipe/deleteCart.ssg")
	public void delete(@RequestParam("no") String user_id, @RequestParam("ing_id") int ing_id, HttpServletResponse res) throws Exception {
		boolean result = service.deleteCart(user_id, ing_id);
		PrintWriter out = res.getWriter();
		res.setContentType("text/html;charset=utf-8");
		String s = "location.href='/ssgssag/recipe/cart.ssg?no=" + user_id + "';";
		
		if (result) {
			out.print("<script>");
			out.print("alert('정상적으로 삭제되었습니다.');");
			out.print(s);
			out.print("</script>");
		} else {
			out.print("<script>");
			out.print("alert('삭제 실패');");
			out.print(s);
			out.print("</script>");
		}
	}
}
