package com.shinsegae.ssgssag.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinsegae.ssgssag.common.util.EncyrptionUtils;
import com.shinsegae.ssgssag.member.mapper.MemberMapper;
import com.shinsegae.ssgssag.member.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor // final이 붙거나 @NotNull 이 붙은 필드의 생성자를 자동 생성해주는 롬복 어노테이션
// 유저 계정의 DB와 관련된 로직을 처리하자
// 회원가입, 로그인, 로그아웃, 회원정보 수정
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	// 회원가입
	public int joinMember(MemberVO memberVO) {
		return memberMapper.joinMember(memberVO);
	}
	
	// 아이디 중복 확인
//	public int checkId(String id) throws Exception {
//		int result = 0;
//		if (memberMapper.checkId(id) != null)
//			result = 1;
//		return result;
//	}
	
	// 로그인 검증 (계정 존재 여부 + 비밀번호 일치 여부)
//	@Override
	public MemberVO loginAction(MemberVO memberVO) throws Exception {
		MemberVO exist = memberMapper.existedMember(memberVO); // 이거 세션에 어떻게 저장함??????
		// 존재하고 + 입력한 비밀번호 == 객체 안에 든 비밀번호!!!
		if (exist == null) {
			return null; // 존재하지 않는다
		} else {
			return exist;
			
//			// 존재한다면, 비밀번호를 확인해보자 => 오히려 너무 많은 힌트를 줘서 보안이 약해지는 역효과!
//			String encryptedPwd = EncyrptionUtils.encryptSHA256(memberVO.getPassword());
//			String correctPwd = exist.getPassword();
//			
//			if (correctPwd.equals(encryptedPwd)) {
//				return 1;
//			} else {
//				return -2; // 비밀번호 불일치
//			}				
		}
	}
	
	// 로그아웃
	
	
}
