package com.shinsegae.ssgssag.recipe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.shinsegae.ssgssag.recipe.service.RecipeService;
import com.shinsegae.ssgssag.recipe.vo.RecipeVO;

@Controller
public class RecipeController {

	@Autowired
	RecipeService service;
	
	// ��ü ��ȸ - ���� �� ���� (JSON �迭)
	@GetMapping("/recipe/recipe.ssg")
	public String getAll(HttpServletRequest req) {
		System.out.println("### Controller ###");
		List<RecipeVO> obj = service.all();	// ���� ȣ��
//		System.out.println(obj.size());
//		System.out.println(obj.get(0));
		req.setAttribute("list", obj);
		return "recipe/recipe";
	}
}
