package com.shinsegae.ssgssag.recipe.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shinsegae.ssgssag.member.vo.MemberVO;
import com.shinsegae.ssgssag.recipe.service.RecipeCatService;
import com.shinsegae.ssgssag.recipe.service.RecipeDesService;
import com.shinsegae.ssgssag.recipe.service.RecipeIngService;
import com.shinsegae.ssgssag.recipe.service.RecipeMyService;
import com.shinsegae.ssgssag.recipe.service.RecipeService;
import com.shinsegae.ssgssag.recipe.service.RecipeTagService;
import com.shinsegae.ssgssag.recipe.vo.RecipeLikeVO;
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
		List<RecipeVO> obj = service.reci(vo);	// Service
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
		
		List<RecipeVO> obj3 = service.rcp_tag(vo);
		
		req.setAttribute("list", obj2);
		req.setAttribute("page", pagebutton);
		req.setAttribute("rcp_tag", obj3);

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
		
		
		
		int total = obj.size();
		int cur = vo.getCurpage();
		vo.setCurpage(cur);
		System.out.println("tets");
		System.out.println(vo.getSort());
		System.out.println(vo.getTag_id());
		System.out.println(vo.getTag_name());
		System.out.println(vo.getCat());
		System.out.println(vo.getCategory_name());
		if (total % 5 == 0 ) {
			vo.setTotal_count(total/5);
		}
		else {
			vo.setTotal_count(total/5 + 1);
		}
		vo.setStart((cur-1)*5);
		List<RecipeVO> obj2 = service_tag.rcpTags_page(vo);
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
		
		
		List<RecipeVO> obj3 = service.rcp_tag(vo);
	
		req.setAttribute("list_tag", obj2);
		req.setAttribute("page", pagebutton);
		req.setAttribute("rcp_tag", obj3);

		return "recipe/recipe_tag";
	}

	@GetMapping("/recipe/recipe_des.ssg")
	public String test(HttpServletRequest req, RecipeVO vo, HttpSession sess) {
		List<RecipeVO> obj = service_des.getIngs(vo);
		List<RecipeVO> obj2 = service_des.getSteps(vo);
		RecipeVO obj3 = service_des.getImgs(vo);
		List<RecipeVO> obj4 = service.rcp_tag(vo);
		
		req.setAttribute("list_ing", obj);
		req.setAttribute("list_step", obj2);
		req.setAttribute("list_des", obj3);
		req.setAttribute("rcp_tag", obj4);
		
		System.out.println("### Recipe Ing Controller ###");
		
		// 좋아요(찜) 여부 조회를 위한 기능
		RecipeLikeVO recipeLike = new RecipeLikeVO();
		// 레시피 ID와 유저 번호 담기
		int recipe_id = vo.getRecipe_id();
		MemberVO currentUser = (MemberVO) sess.getAttribute("currentUser");
		// 로그인 하지 않았을 때 오류가 나지 않도록 null에 대한 처리 해주기
		if (currentUser != null) {
			// 로그인 유저는 그대로 진행한다
			int user_no = currentUser.getUser_no();
			// 두 정보로 좋아요 여부 조회하기
			recipeLike = service.isLiked(recipe_id, user_no);
			// 조회해서 받은 정보는 세션에 담아두기
			sess.setAttribute("recipeLike", recipeLike);
		} else {
			// 비로그인 상태에서는 조회 자체가 불가능하므로, null을 담아서 리턴한다
			sess.setAttribute("recipeLike", null);
		}
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
		List<RecipeVO> obj5 = service.rcp_tag(vo);
		
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
		req.setAttribute("rcp_tag", obj5);
		
		return "recipe/recipe_ing";
	}
	

	
	
	
	

	// 레시피 좋아요
	@PostMapping("/recipe/recipe_like.ssg")
	@ResponseBody
	public String pushLike(RecipeLikeVO recipeLikeVO) {
		System.out.println("==========================/recipe/recipe_like요청 ================");
		int isLiked = service.insertLike(recipeLikeVO);
		System.out.println("==========isLiked:" + isLiked + "=================");
		return isLiked+"";
	}
	
	// home 접속 시 인기 레시피 5개 보내주기
	@GetMapping("/")
	public String hotRecipeList(HttpServletRequest req, RecipeVO vo) {
		System.out.println("### hotRecipeList ###");
		List<RecipeVO> obj = service.hotRe(vo);	// Service
		req.setAttribute("hotRecipe_list", obj);

		return "home";
	}
}