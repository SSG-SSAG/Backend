package com.shinsegae.ssgssag.recipe.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shinsegae.ssgssag.recipe.service.CartService;
import com.shinsegae.ssgssag.recipe.vo.CartVO;

@Controller
public class CartController {
	
	@Autowired
	CartService service;
	
	@GetMapping("cart.ssg")
	public String cart(@RequestParam(value="onssg", defaultValue = "0") String onssg, @RequestParam("no") String user_id, @RequestParam(value="recipe_id", required=false) String recipe_id, HttpServletRequest req) throws Exception {
	
		if (onssg.equals("1")) {
			System.out.println("pythonbuilder ");
			try {
		        String arg1 = "C:\\Users\\SSG\\Desktop\\ssag\\ssag.py";
		        System.out.println("dkfkd");
		        System.out.println(user_id);
		        ProcessBuilder builder = new ProcessBuilder("python",arg1, user_id);
		     
		        builder.redirectErrorStream(true);
		        Process process = builder.start();
	
		        int exitval = process.waitFor();
	
		        BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream(),"UTF-8"));
	
		        String line;
		        while ((line = br.readLine()) != null) {
		            System.out.println(">>>  " + line); // 표준출력에 쓴다
		        }
			} catch (Exception e) {
				System.out.println(e);
			}
	       
		}
		
		List<CartVO> obj = service.getIngs(user_id);
		List<String> contain_id = new ArrayList<>();
		for ( int i = 0; i<obj.size(); i++) {
			contain_id.add(obj.get(i).getIng_id());
		}
		if (recipe_id != null) {
			List<CartVO> list = service.rcpIngs(recipe_id);
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
		req.setAttribute("list", obj_final);
		
		return "recipe/cart";
	}

	@GetMapping(value="deleteCart.ssg")
	public void delete(@RequestParam("no") String user_id, @RequestParam("ing_id") int ing_id, HttpServletResponse res) throws Exception {
		boolean result = service.deleteCart(user_id, ing_id);
		PrintWriter out = res.getWriter();
		res.setContentType("text/html;charset=utf-8");
		String s = "location.href='/ssgssag/cart.ssg?no=" + user_id + "';";
		
		if (result) {
			out.print("<script>");
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
