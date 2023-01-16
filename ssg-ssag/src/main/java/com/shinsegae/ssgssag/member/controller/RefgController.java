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
import com.shinsegae.ssgssag.vo.ingVO;

@Controller
public class RefgController {
	
	@Autowired
	RefgService service;
	@Autowired
	RefgMapper mapper;
	private String curid = "";
	
	@GetMapping(value="refg.ssg")
	public String getList(@RequestParam("no") String no,HttpServletRequest req) {
		curid = no;
		List<RefgVO> list = service.getList(no);
		for ( int i = 0; i<list.size(); i++) {
			String name = service.getName(list.get(i).getIng_id());
			list.get(i).setIng_name(name);
		}
		req.setAttribute("list", list);
		return "member/refg";
	}
	
	@GetMapping(value="delete.ssg")
	public void delete(@RequestParam("refg_id") String param, HttpServletResponse res) throws Exception {
		boolean result = service.delete(param);
		PrintWriter out = res.getWriter();
		res.setContentType("text/html;charset=utf-8");
		String s = "location.href='refg.ssg?no=" + curid+"';";
		if (result) {
			out.print("<script>");
			out.print("alert('정상적으로 삭제되었습니다.');");
			out.print(s);
			out.print("</script>");
		}
		else {
			out.print("<script>");
			out.print("alert('삭제 실패');");
			out.print(s);
			out.print("</script>");
		}
	}
	
	@GetMapping(value="refg_new.ssg")
	public void add(ingVO vo, HttpServletResponse res) throws Exception {
		String s = "location.href='refg.ssg?no=" + curid+"';";
		PrintWriter out = res.getWriter();
		res.setContentType("text/html;charset=utf-8");

		int result = service.add(vo.getIng_name(), vo.getExpire_date(), curid);
		if (result == 0) {
			out.print("<script>");
			out.print("alert('재료명을 다시 입력해주세요.');");
			out.print(s);
			out.print("</script>");
		}
		else if (result == 1) {
			out.print("<script>");
			out.print("alert('이미 냉장고에 있는 재료입니다.');");
			out.print(s);
			out.print("</script>");
		}
		else {
			out.print("<script>");
			out.print("alert('추가 성공');");
			out.print(s);
			out.print("</script>");
		}
	}
	
}