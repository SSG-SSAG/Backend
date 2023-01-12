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
		
		/* �ùٸ� ���̵��� */
		member.setId("test1");
		member.setPassword("test1234");
		
//		/*Ʋ�� ���̵� */
//		member.setId("test1");
//		member.setPassword("test1234");
//		
//		/* Ʋ�� ��й�ȣ */
//		member.setId("test1");
//		member.setPassword("test12345");
		
		MemberVO result = memberMapper.existedMember(member);
		System.out.println("��� ��: "+ result);
		
	}
}
