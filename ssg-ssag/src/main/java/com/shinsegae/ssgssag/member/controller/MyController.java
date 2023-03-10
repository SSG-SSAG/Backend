package com.shinsegae.ssgssag.member.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shinsegae.ssgssag.member.mapper.MyMapper;
import com.shinsegae.ssgssag.member.service.MyService;
import com.shinsegae.ssgssag.member.vo.MyVO;

@Controller
public class MyController {
	
	@Autowired
	MyService service;
	@Autowired
	MyMapper mapper;
	private int user_no;
	
	@GetMapping("/member/mypage.ssg")
	public String getTag(HttpServletRequest req, MyVO vo) {
		System.out.println(vo);
		System.out.println("### MyTags Controller ###");
		List<MyVO> obj = service.tags(vo);
		user_no = vo.getUser_no();
		req.setAttribute("list_tags", obj);
		//vo.setMytag("0");
		return "member/mypage";
	}
	
	@GetMapping(value="/member/deleteTag.ssg")
	public void delete(@RequestParam("like_tag_id") String like_tag_id, HttpServletResponse res) throws Exception {
		boolean result = service.deleteTag(like_tag_id);
		PrintWriter out = res.getWriter();
		res.setContentType("text/html;charset=utf-8");
		String s = "location.href='/ssgssag/member/mypage.ssg?user_no=" + Integer.toString(user_no) + "';";
		
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
	
	@GetMapping(value="/member/tag_new.ssg")
	public void addTag(HttpServletResponse res, MyVO vo) throws Exception {
		String s = "location.href='/ssgssag/member/mypage.ssg?user_no=" + Integer.toString(user_no) + "';";
		PrintWriter out = res.getWriter();
		res.setContentType("text/html;charset=utf-8");
		System.out.println("###### Add Tag Controller ######");
		
		int result = service.addTag(vo.getTag_id(), vo.getTag_name(), Integer.toString(user_no));
		System.out.println("result : " + result);
		
		if (result == 1) {
			//vo.setMytag(false);
			System.out.println("관심 태그에 이미 존재");
			out.print("<script>");
			out.print("alert('이미 관심 태그에 존재합니다.');");
			out.print(s);
			out.print("</script>");
		}
		else {
			//vo.setMytag(true);
			System.out.println("관심 태그 추가 성공");
			out.print("<script>");
			out.print(s);
			out.print("</script>");
		}
	}
	
	@GetMapping("/member/change.ssg")
	public String getUser(HttpServletRequest req, MyVO vo) {
		System.out.println(vo);
		System.out.println("### MyUsers Controller ###");
		List<MyVO> obj = service.users(vo);
		req.setAttribute("list_users", obj);
		return "member/change";
	}
}