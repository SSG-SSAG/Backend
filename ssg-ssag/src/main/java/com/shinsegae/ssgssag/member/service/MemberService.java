package com.shinsegae.ssgssag.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinsegae.ssgssag.member.mapper.MemberMapper;
import com.shinsegae.ssgssag.member.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor // final�� �ٰų� @NotNull �� ���� �ʵ��� �����ڸ� �ڵ� �������ִ� �Һ� ������̼�
// ���� ������ DB�� ���õ� ������ ó������
// ȸ������, �α���, �α׾ƿ�, ȸ������ ����
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	// ȸ������
	public int joinMember(MemberVO memberVO) {
		return memberMapper.joinMember(memberVO);
	}
	
}
