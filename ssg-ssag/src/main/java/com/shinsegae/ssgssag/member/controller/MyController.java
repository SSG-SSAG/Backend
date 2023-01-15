package com.shinsegae.ssgssag.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.shinsegae.ssgssag.member.mapper.MyMapper;
import com.shinsegae.ssgssag.member.service.MyService;
import com.shinsegae.ssgssag.member.vo.MyVO;

@Controller
public class MyController {
	
	@Autowired
	MyService service;
	@Autowired
	MyMapper mapper;
	
	@GetMapping("/member/mypage.ssg")
	public String getTag(HttpServletRequest req, MyVO vo) {
		System.out.println("### MyTags Controller ###");
		List<MyVO> obj = service.tags(vo);
		req.setAttribute("list_tags", obj);
		return "member/mypage";
	}
	
}