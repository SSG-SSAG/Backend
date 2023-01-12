package com.shinsegae.ssgssag.member;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.shinsegae.ssgssag.member.mapper.MemberMapper;
import com.shinsegae.ssgssag.member.vo.MemberVO;

public class LoginTest {
	
	@Autowired
	private MemberMapper memberMapper;

	@Test
	public void memberLogin() throws Exception {
		
		MemberVO member = new MemberVO();
		
		/* 올바른 아이디비번 */
		member.setId("test1");
		member.setPassword("test1234");
		
//		/*틀린 아이디 */
//		member.setId("test1");
//		member.setPassword("test1234");
//		
//		/* 틀린 비밀번호 */
//		member.setId("test1");
//		member.setPassword("test12345");
		
		MemberVO result = memberMapper.existedMember(member);
		System.out.println("결과 값: "+ result);
		
	}
}
