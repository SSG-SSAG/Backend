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

	
	// 회원 가입 페이지로 이동
	@GetMapping("/auth/signup")
	public String signUp() {
		return "member/signup";
 
	}
	
	// 회원 가입
	@PostMapping("/auth/signup")
	public void signUp(MemberVO memberVO, HttpServletResponse res) throws Exception {
		int r = memberService.joinMember(memberVO);
		
		String msg = "";
		String url = "";
		if (r >0 ) {
			msg = "정상적으로 저장되었습니다";
			url="index.ssg";
		} else {
			msg = "저장 실패";
			url="write.ssg";
		}
		alert(res, msg, url);
	}
	
//	@RequestMapping(value="/member/signup_ok", method=RequestMethod.POST)
//	public String joinMember(MemberVO memberVO) {
//		int result = memberService.joinMember(memberVO);
//		
//		// result !=0 => 회원 가입 성공
//		if (result > 0) {
//			return "member/login"; 
//		}
//		
//		// 회원 가입 실패
//		return "member/signup";
//		
//	}
}
