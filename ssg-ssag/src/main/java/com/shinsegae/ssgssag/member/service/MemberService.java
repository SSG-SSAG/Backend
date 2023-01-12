package com.shinsegae.ssgssag.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinsegae.ssgssag.common.util.EncyrptionUtils;
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
	
	// �α��� ���� (���� ���� ���� + ��й�ȣ ��ġ ����)
//	@Override
	public int loginAction(MemberVO memberVO) throws Exception {
		MemberVO exist = memberMapper.existedMember(memberVO); // �̰� ���ǿ� ��� ������??????
		// �����ϰ� + �Է��� ��й�ȣ == ��ü �ȿ� �� ��й�ȣ!!!
		if (exist == null) {
			return -1; // �������� �ʴ´�
		} else {
			// �����ϰ�
			String encryptedPwd = EncyrptionUtils.encryptSHA256(memberVO.getCheck_password());
			String correctPwd = exist.getPassword();
			
			if (correctPwd.equals(encryptedPwd)) {
				return 1;
			} else {
				return -2; // ��й�ȣ ����ġ
			}				
		}
	}
	
	// �α׾ƿ�
	
	
}
