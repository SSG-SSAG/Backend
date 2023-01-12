package com.shinsegae.ssgssag.member.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	// auth/signup으로 GET 요청을 보내면 member/signup 페이지를 보여준다
	@GetMapping("/auth/signup")
	public String signUp() {
		return "member/signup";
	}
	
	// 아이디 중복 확인
//	@RequestMapping(value="/checkId", method = RequestMethod.GET)
//	@ResponseBody
//	public String checkId(String id) throws Exception {
//		return memberService.checkId(id) + "";
//	}
	
	// 회원 가입
	@PostMapping("/auth/signup.ssg")
	public void signUp(MemberVO memberVO, HttpServletResponse res) throws Exception {
		int r = memberService.joinMember(memberVO);
		
		String msg = "";
		String url = "";
		if (r >0 ) {
			msg = "회원가입 완료!";
			url="/ssgssag/auth/login";
		} else {
			msg = "회원가입에 실패하였습니다";
			url="/ssgssag/auth/signup";
		}
		alert(res, msg, url);
	}
	
	// 로그인 페이지로 이동
	// auth/login으로 GET 요청을 보내면 member/login 페이지를 보여준다
	@GetMapping(value="auth/login.ssg")
	public String Login(Model model) throws Exception {
		return "member/login";
	}
	
	// 로그인 실행
	/*
	 * 1: 로그인 성공
	 * -1: 없는 계정(아이디 틀림)
	 * -2: 비밀번호 불일치
	 * */
	@PostMapping(value="auth/login.ssg")
	@ResponseBody
	public void loginAction(
			MemberVO memberVO, HttpServletRequest req, HttpServletResponse res, HttpSession sess
			) throws Exception {
		
		/*
		 * MemberVo: 데이터 전달 받는 용
		 * HttpServletRequest: 로그인 성공 시 session에 회원 정보 저장
		 * HttpServletResponse: 로그인 실패 시 session에 에러 저장해서 BaseController로 보내기
		 * */
		
		String msg = "";
		String url = "";
		// 아이디와 비밀번호 검증
		MemberVO currentUser = memberService.loginAction(memberVO);
			
		if (currentUser != null) {
			msg = "로그인에 성공했습니다!";
			url = "/ssgssag"; // 메인으로 이동
			// 세션에 로그인 데이터 저장
			sess.setAttribute("currentUser", currentUser);
		} else {
			msg = "아이디와 비밀번호를 다시 확인해주세요";
			url = "redirect:/ssgssag/auth/login";			
		}
			
//		} else if (result == -1 ){
//			msg = "계정이 없어요. 회원가입 먼저 해주세요!" ;
//			url = "/ssgssag/auth/signup"; // 회원가입 페이지로 이동
//		} else {
//			msg = "비밀번호가 틀렸어요. 다시 시도해주세요!";
//			url = "/ssgssag/auth/login"; // 로그인 페이지로 재이동
//		}
		alert(res, msg, url);
	}
	
}
