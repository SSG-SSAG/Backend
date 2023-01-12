package com.shinsegae.ssgssag.recipe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shinsegae.ssgssag.recipe.service.RecipeDesService;
import com.shinsegae.ssgssag.recipe.service.RecipeService;
import com.shinsegae.ssgssag.recipe.vo.RecipeVO;

@Controller
public class RecipeController {

	@Autowired
	RecipeService service;
	@Autowired
	RecipeDesService service_des;
	
	// ��ü ��ȸ - ���� �� ���� (JSON �迭)
	@GetMapping("/recipe/recipe.ssg")
	public String getAll(HttpServletRequest req, RecipeVO vo) {
		System.out.println("### Recipe Controller ###");
		List<RecipeVO> obj = service.reci(vo);	// ���� ȣ��
		req.setAttribute("list", obj);
		return "recipe/recipe";
	}
	
//	@GetMapping("/recipe/recipe.ssg")
	@GetMapping("/recipe/recipe_search.ssg")
	public String getIng(HttpServletRequest req, RecipeVO vo) {
		System.out.println("### Ingredient Controller ###");
		System.out.println(vo.getRname());
//		System.out.println();
		List<RecipeVO> obj = service.reci(vo);	// ���� ȣ��
		req.setAttribute("list", obj);
		System.out.println("checkpoint");
		return "recipe/recipe";
	}
	
	@GetMapping("/recipe/recipe_des.ssg")
	public String test(@RequestParam("recipe_id") String recipe_id, HttpServletRequest req) {
		List<String> obj = service_des.getIngs(recipe_id);
		List<String> obj2 = service_des.getSteps(recipe_id);
		req.setAttribute("list_ing", obj);
		req.setAttribute("list_step", obj2);
		System.out.println("k");
		System.out.println(obj2);
		return "recipe/recipe_des";
	}
}