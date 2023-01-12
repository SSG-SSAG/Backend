package com.shinsegae.ssgssag.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shinsegae.ssgssag.common.BaseController;
import com.shinsegae.ssgssag.member.service.MemberService;
import com.shinsegae.ssgssag.member.vo.MemberVO;

//@RestController
//@RequestMapping("/api")
//@RequiredArgsConstructor
@Controller
public class MemberController extends BaseController {
	
	@Autowired
	private MemberService memberService;

	
	// ȸ�� ���� �������� �̵�
	// auth/signup���� GET ��û�� ������ member/signup �������� �����ش�
	@GetMapping("/auth/signup")
	public String signUp() {
		return "member/signup";
 
	}
	
	// ȸ�� ����
	@PostMapping("/auth/signup")
	public void signUp(MemberVO memberVO, HttpServletResponse res) throws Exception {
		int r = memberService.joinMember(memberVO);
		
		String msg = "";
		String url = "";
		if (r >0 ) {
			msg = "ȸ������ �Ϸ�!";
			url="/ssgssag/auth/login";
		} else {
			msg = "ȸ�����Կ� �����Ͽ����ϴ�";
			url="/ssgssag/auth/signup";
		}
		alert(res, msg, url);
	}
	
	// �α��� �������� �̵�
	// auth/login���� GET ��û�� ������ member/login �������� �����ش�
	@GetMapping(value="auth/login")
	public String Login(Model model) throws Exception {
		return "member/login";
	}
	
	// �α��� ����
	/*
	 * 1: �α��� ����
	 * -1: ���� ����(���̵� Ʋ��)
	 * -2: ��й�ȣ ����ġ
	 * */
	@PostMapping(value="auth/login")
	@ResponseBody
	public void loginAction(
			MemberVO memberVO, HttpSession session, HttpServletResponse res) throws Exception {
		
		String msg = "";
		String url = "";
		// ���̵�� ��й�ȣ ����
		int result = memberService.loginAction(memberVO);
			
		if (result == 1) {
			msg = "�α��ο� �����߽��ϴ�!";
			url = "/ssgssag"; // �������� �̵�
		} else if (result == -1 ){
			msg = "������ �����. ȸ������ ���� ���ּ���!" ;
			url = "/ssgssag/auth/signup"; // ȸ������ �������� �̵�
		} else {
			msg = "��й�ȣ�� Ʋ�Ⱦ��. �ٽ� �õ����ּ���!";
			url = "/ssgssag/auth/login"; // �α��� �������� ���̵�
		}
		alert(res, msg, url);
		
		
	}
	
}
