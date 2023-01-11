package com.shinsegae.ssgssag.recipe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.shinsegae.ssgssag.recipe.service.RecipeService;
import com.shinsegae.ssgssag.recipe.vo.RecipeVO;

@Controller
public class RecipeController {

	@Autowired
	RecipeService service;
	
	// 전체 조회 - 여러 건 응답 (JSON 배열)
	@GetMapping("/recipe/recipe.ssg")
	public String getAll(HttpServletRequest req, RecipeVO vo) {
		System.out.println("### Recipe Controller ###");
		List<RecipeVO> obj = service.reci(vo);	// 서비스 호출
		req.setAttribute("rlist", obj);
		return "recipe/recipe";
	}
	
//	@GetMapping("/recipe/recipe.ssg")
	@PostMapping("/recipe/recipe.ssg")
	public String getIng(HttpServletRequest req, RecipeVO vo) {
		System.out.println("### Ingredient Controller ###");
		List<RecipeVO> obj = service.ingre(vo);	// 서비스 호출
		req.setAttribute("ilist", obj);
		return "recipe/recipe";
	}
}
