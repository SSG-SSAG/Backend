package com.shinsegae.ssgssag.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

// ��������, ���� ����ϴ� ��
public class BaseController {
	
	// alert
	public void alert(HttpServletResponse res, String msg, String url) throws Exception {
		res.setContentType("text/html; charset=utf-8;");
		PrintWriter out = res.getWriter();
		out.print("<script>");
		out.print("alert('"+msg+"');");
		out.print("location.href='"+url+"';");
		out.print("</script>");
	}
}
