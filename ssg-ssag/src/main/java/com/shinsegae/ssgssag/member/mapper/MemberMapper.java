package com.shinsegae.ssgssag.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shinsegae.ssgssag.member.vo.MemberVO;

@Mapper
public interface MemberMapper {

	// ���̵� ��ȸ
	List<MemberVO> alreadyMember(String id);
	
	// ȸ������
	int joinMember(MemberVO memberVO);
	
	// �α���
	public MemberVO loginMember(MemberVO memberVO);
}
