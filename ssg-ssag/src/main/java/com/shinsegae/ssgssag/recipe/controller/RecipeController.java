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
	
//	// 전체 조회 - 여러 건 응답 (JSON 배열)
//	@GetMapping("/recipe/recipe.ssg")
//	public String getAll(HttpServletRequest req, RecipeVO vo) {
//		System.out.println("### Recipe Controller ###");
//		List<RecipeVO> obj = service.reci(vo);	// 서비스 호출
//		req.setAttribute("list", obj);
//		return "recipe/recipe";
//	}
	
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
	public String test(HttpServletRequest req, RecipeVO vo, HttpSession sess) {
		List<RecipeVO> obj = service_des.getIngs(vo);
		List<RecipeVO> obj2 = service_des.getSteps(vo);
		req.setAttribute("list_ing", obj);
		req.setAttribute("list_step", obj2);
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
		req.setAttribute("list_detail", obj);
		req.setAttribute("list_nut", obj2);
		req.setAttribute("list_ref", obj3);
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
	
//	public String recipeLike(@RequestParam("recipe_id") int recipe_id, HttpSession sess) {
//		
//		// 파라미터로 넘긴 레시피 아이디와 현재 로그인한 유저 정보를 통해 좋아요 여부 확인하기
//		// 관련 데이터를 담을 VO
//		RecipeLikeVO vo = new RecipeLikeVO();
//		
//		// 레시피 번호 담기
//		vo.setRecipe_id(recipe_id);
//		
//		// 유저 번호, 닉네임 담기
//		vo.setUser_no((int) sess.getAttribute("user_no"));
//		vo.setId((String) sess.getAttribute("id"));
//		
//		// 조회부터
//		boolean isRecipeLiked = service.isLiked(vo);
//		
//		// 좋아요 취소 (이미 눌러놨다면 true => 취소해주세요)
//		if (isRecipeLiked) {
//			System.out.println("눌러놨었네~");
//			
//		} else {
//		// 좋아요 (안 눌러놨다면 false => 누르기)
//			System.out.println("이제 누를게요");			
//		}
//		return "/";
//		
//	}
}