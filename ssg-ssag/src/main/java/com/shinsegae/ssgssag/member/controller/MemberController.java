package com.shinsegae.ssgssag.member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
			msg = "���������� ����Ǿ����ϴ�";
			url="index.ssg";
		} else {
			msg = "���� ����";
			url="write.ssg";
		}
		alert(res, msg, url);
	}
	
//	@RequestMapping(value="/member/signup_ok", method=RequestMethod.POST)
//	public String joinMember(MemberVO memberVO) {
//		int result = memberService.joinMember(memberVO);
//		
//		// result !=0 => ȸ�� ���� ����
//		if (result > 0) {
//			return "member/login"; 
//		}
//		
//		// ȸ�� ���� ����
//		return "member/signup";
//		
//	}
}
