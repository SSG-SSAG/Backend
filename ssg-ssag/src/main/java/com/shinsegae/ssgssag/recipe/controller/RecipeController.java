package com.shinsegae.ssgssag.recipe.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		for ( int i = 0; i<obj2.size(); i++) {
			if ( obj2.get(i).getRecipe_ing_info() == null) {
				obj2.get(i).setRecipe_ing_info("?????? ??????");
			}
			String star = "";
			for ( int j = 0; j<obj2.get(i).getLevel(); j++) {
				star += "???";
				obj2.get(i).setStar(star);
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
		for ( int i = 0; i<obj.size(); i++) {
			if ( obj.get(i).getRecipe_ing_info() == null) {
				obj.get(i).setRecipe_ing_info("?????? ??????");
			}
		}
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
		for ( int i = 0; i<obj2.size(); i++) {
			if ( obj2.get(i).getRecipe_ing_info() == null) {
				obj2.get(i).setRecipe_ing_info("?????? ??????");
			}
			String star = "";
			for ( int j = 0; j<obj2.get(i).getLevel(); j++) {
				star += "???";
				obj2.get(i).setStar(star);
			}
		}
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
		
		// ?????????(???) ?????? ????????? ?????? ??????
		RecipeLikeVO recipeLike = new RecipeLikeVO();
		// ????????? ID??? ?????? ?????? ??????
		int recipe_id = vo.getRecipe_id();
		MemberVO currentUser = (MemberVO) sess.getAttribute("currentUser");
		// ????????? ?????? ????????? ??? ????????? ?????? ????????? null??? ?????? ?????? ?????????
		if (currentUser != null) {
			// ????????? ????????? ????????? ????????????
			int user_no = currentUser.getUser_no();
			// ??? ????????? ????????? ?????? ????????????
			recipeLike = service.isLiked(recipe_id, user_no);
			// ???????????? ?????? ????????? ????????? ????????????
			sess.setAttribute("recipeLike", recipeLike);
		} else {
			// ???????????? ??????????????? ?????? ????????? ??????????????????, null??? ????????? ????????????
			sess.setAttribute("recipeLike", null);
		}
		return "recipe/recipe_des";
	}
	
	@GetMapping("/recipe/recipe_ing.ssg")
	public String getMaking(HttpServletRequest req, RecipeVO vo, @RequestParam(value="addone", defaultValue = "-1") String ing_id) {
		if (!ing_id.equals("-1")) {
			int r = service_ing.addone(ing_id, vo.getUser_id());
			System.out.println("kdkdkdkd");
			System.out.println(r);
		}
		System.out.println("### Recipe Ing Controller ###");
		List<RecipeVO> obj = service_ing.ings(vo);
		List<RecipeVO> obj2 = service_ing.nut(vo);
		List<RecipeVO> obj3 = service_ing.ref(vo);
		List<Integer> my_ings = new ArrayList<>();
		RecipeVO obj4 = service_des.getImgs(vo);
		List<RecipeVO> obj5 = service.rcp_tag(vo);
		List<String> cart_ings = service_ing.getCart(vo);
		System.out.println("mimmimdidkdka;ksjdf;dlk");
		System.out.println(cart_ings);
		for ( int i = 0; i<obj3.size(); i++) {
			my_ings.add(obj3.get(i).getIng_id());
		}
		List<RecipeVO> mine = new ArrayList<>();
		List<RecipeVO> notmine = new ArrayList<>();
		List<RecipeVO> incart = new ArrayList<>();
		for ( int i = 0; i<obj.size(); i++) {
			if (my_ings.contains(obj.get(i).getIng_id())) {
				obj.get(i).setMy_ing(true);
				mine.add(obj.get(i));
			}
			else if (cart_ings.contains(String.valueOf(obj.get(i).getIng_id()))) {
				incart.add(obj.get(i));
			}
			else {
				notmine.add(obj.get(i));
			}
		}
		System.out.println("test");
		System.out.println(mine);
		req.setAttribute("list_incart", incart);
		req.setAttribute("list_mine", mine);
		req.setAttribute("list_notmine", notmine);
		req.setAttribute("list_nut", obj2);
		req.setAttribute("list_ref", obj3);
		req.setAttribute("list_des", obj4);
		req.setAttribute("rcp_tag", obj5);
		
		return "recipe/recipe_ing";
	}
	

	
	
	
	

	// ????????? ?????????
	@PostMapping("/recipe/recipe_like.ssg")
	@ResponseBody
	public String pushLike(RecipeLikeVO recipeLikeVO) {
		System.out.println("==========================/recipe/recipe_like?????? ================");
		int isLiked = service.insertLike(recipeLikeVO);
		System.out.println("==========isLiked:" + isLiked + "=================");
		return isLiked+"";
	}
	
	// home ?????? ??? ?????? ????????? 5??? ????????????
	@GetMapping("/")
	public String hotRecipeList(HttpServletRequest req, RecipeVO vo) {
		System.out.println("### hotRecipeList ###");
		List<RecipeVO> obj = service.hotRe(vo);	// Service
		for ( int i = 0; i<obj.size(); i++) {
			List<String> tags = service.getTag(String.valueOf(obj.get(i).getRecipe_id()));
			String tag = "";
			for ( int j = 0; j<tags.size(); j++) {
				tag += "#" + tags.get(j);
			}
			obj.get(i).setTags(tag);
		}
		
		req.setAttribute("hotRecipe_list", obj);

		return "home";
	}
}