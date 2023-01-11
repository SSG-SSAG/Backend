package com.shinsegae.ssgssag.member.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shinsegae.ssgssag.member.mapper.RefgMapper;
import com.shinsegae.ssgssag.member.service.RefgService;
import com.shinsegae.ssgssag.vo.RefgVO;

@Controller
public class RefgController {
	
	@Autowired
	RefgService service;
	@Autowired
	RefgMapper mapper;
	
	@GetMapping(value="refg.ssg")
	public String getList(HttpServletRequest req) {
		List<RefgVO> list = service.getList("1");
		for ( int i = 0; i<list.size(); i++) {
			String name = service.getName(list.get(i).getIng_id());
			list.get(i).setIng_name(name);
		}
		req.setAttribute("list", list);
		return "member/refg";
	}
	
	@GetMapping(value="delete.ssg")
	public void delete(@RequestParam("refg_id") String param, HttpServletResponse res) throws Exception {
		System.out.println("askdjs;adjasldjlsa;j");
		System.out.println(param);
		boolean result = service.delete(param);
		PrintWriter out = res.getWriter();
		res.setContentType("text/html;charset=utf-8");
		if (result) {
			out.print("<script>");
			out.print("alert('정상적으로 삭제되었습니다.');");
			out.print("location.href='refg.ssg';");
			out.print("</script>");
		}
		else {
			out.print("<script>");
			out.print("alert('삭제 실패');");
			out.print("location.href='refg.ssg';");
			out.print("</script>");
		}
	}
	
}
