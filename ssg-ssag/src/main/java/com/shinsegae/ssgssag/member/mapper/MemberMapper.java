package com.shinsegae.ssgssag.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shinsegae.ssgssag.member.vo.MemberVO;

@Mapper
public interface MemberMapper {

	// 아이디 조회
	List<MemberVO> alreadyMember(String id);
	
	// 회원가입
	int joinMember(MemberVO memberVO);
	
	// 로그인
	public MemberVO loginMember(MemberVO memberVO);
}
