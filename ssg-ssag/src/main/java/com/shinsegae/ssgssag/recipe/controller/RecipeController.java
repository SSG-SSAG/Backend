package com.shinsegae.ssgssag.recipe.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.shinsegae.ssgssag.recipe.service.RecipeCatService;
import com.shinsegae.ssgssag.recipe.service.RecipeDesService;
import com.shinsegae.ssgssag.recipe.service.RecipeIngService;
import com.shinsegae.ssgssag.recipe.service.RecipeMyService;
import com.shinsegae.ssgssag.recipe.service.RecipeService;
import com.shinsegae.ssgssag.recipe.service.RecipeTagService;
import com.shinsegae.ssgssag.recipe.vo.RecipeVO;

@Controller
public class RecipeController {

	@Autowired
	RecipeService service;
	@Autowired
	RecipeDesService service_des;
	@Autowired
	RecipeIngService service_ing;
	@Autowired
	RecipeTagService service_tag;
	@Autowired
	RecipeCatService service_cat;
	@Autowired
	RecipeMyService service_my;
	
	@GetMapping("/recipe/recipe_search.ssg")
	public String getIng(HttpServletRequest req, RecipeVO vo) {
		System.out.println("### Ingredient Controller ###");
		System.out.println(vo.getRname());
		List<RecipeVO> obj = service.reci(vo);	// Service
		System.out.println("checkpoint");

		int total = obj.size();
		int cur = vo.getCurpage();
		vo.setCurpage(cur);
		if (total % 5 == 0 ) {
			vo.setTotal_count(total/5);
		}
		else {
			vo.setTotal_count(total/5 + 1);
		}
		vo.setStart((cur-1)*5);
		List<RecipeVO> obj2 = service.rcp_page(vo);
		int s = cur;
		while (s % 5 != 1) {
			s -= 1;
		}
		List<Integer> pagebutton = new ArrayList<>();
		for ( int i = 0; i<5; i++) {
			if (s+i <= vo.getTotal_count()) {
				pagebutton.add(s+i);
			}
		}
		
		req.setAttribute("list", obj2);
		req.setAttribute("page", pagebutton);

		return "recipe/recipe";
	}
	
	@GetMapping("/recipe/myrecipe.ssg")
	public String getMy(HttpServletRequest req, RecipeVO vo) {
		System.out.println("### Mylist Controller ###");
		List<RecipeVO> obj = service_my.my(vo);
		req.setAttribute("list_my", obj);
		return "recipe/myrecipe";
	}

	@GetMapping("/recipe/recipe_cat.ssg")
	public String getCats(HttpServletRequest req, RecipeVO vo) {
		System.out.println("### Category Controller ###");
		List<RecipeVO> obj = service_cat.cats(vo);
		req.setAttribute("list_cat", obj);
		return "recipe/recipe_cat";
	}

	@GetMapping("/recipe/recipe_tag.ssg")
	public String getTags(HttpServletRequest req, RecipeVO vo) {
		System.out.println("### Tag Controller ###");
		List<RecipeVO> obj = service_tag.tags(vo);
		req.setAttribute("list_tag", obj);
		return "recipe/recipe_tag";
	}

	@GetMapping("/recipe/recipe_des.ssg")
	public String test(HttpServletRequest req, RecipeVO vo) {
		List<RecipeVO> obj = service_des.getIngs(vo);
		List<RecipeVO> obj2 = service_des.getSteps(vo);
		RecipeVO obj3 = service_des.getImgs(vo);
		List<RecipeVO> obj4 = service.rcp_tag(vo);
		
		req.setAttribute("list_ing", obj);
		req.setAttribute("list_step", obj2);
		req.setAttribute("list_des", obj3);
		req.setAttribute("rcp_tag", obj4);
		
		System.out.println("### Recipe Ing Controller ###");
		return "recipe/recipe_des";
	}
	
	@GetMapping("/recipe/recipe_ing.ssg")
	public String getMaking(HttpServletRequest req, RecipeVO vo) {
		System.out.println("### Recipe Ing Controller ###");
		List<RecipeVO> obj = service_ing.ings(vo);
		List<RecipeVO> obj2 = service_ing.nut(vo);
		List<RecipeVO> obj3 = service_ing.ref(vo);
		List<Integer> my_ings = new ArrayList<>();
		RecipeVO obj4 = service_des.getImgs(vo);
		for ( int i = 0; i<obj3.size(); i++) {
			my_ings.add(obj3.get(i).getIng_id());
		}
		for ( int i = 0; i<obj.size(); i++) {
			if (my_ings.contains(obj.get(i).getIng_id())) {
				obj.get(i).setMy_ing(true);
			}
		}
		req.setAttribute("list_detail", obj);
		req.setAttribute("list_nut", obj2);
		req.setAttribute("list_ref", obj3);
		req.setAttribute("list_des", obj4);
		return "recipe/recipe_ing";
	}
}