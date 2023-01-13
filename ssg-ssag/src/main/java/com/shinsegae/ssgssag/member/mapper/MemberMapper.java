package com.shinsegae.ssgssag.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shinsegae.ssgssag.member.vo.MemberVO;

@Mapper
public interface MemberMapper {

	// 아이디 조회
	List<MemberVO> alreadyMember(String id);
	
	// id를 보내면 존재 여부를 확인해서 보내준다
	int checkId(String id);
	
	// 회원가입
	int joinMember(MemberVO memberVO);
	
	// 로그인
	// 로그인 => 존재하는 유저인지 확인, 해당 유저 정보 객체 반환
	public MemberVO existedMember(MemberVO memberVO);
	
	// 비밀번호 확인
	public MemberVO checkPwd(MemberVO memberVO);

}