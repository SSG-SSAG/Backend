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
	
	// ���̵� �ߺ� Ȯ��
//	public int checkId(String id) throws Exception {
//		int result = 0;
//		if (memberMapper.checkId(id) != null)
//			result = 1;
//		return result;
//	}
	
	// �α��� ���� (���� ���� ���� + ��й�ȣ ��ġ ����)
//	@Override
	public MemberVO loginAction(MemberVO memberVO) throws Exception {
		MemberVO exist = memberMapper.existedMember(memberVO); // �̰� ���ǿ� ��� ������??????
		// �����ϰ� + �Է��� ��й�ȣ == ��ü �ȿ� �� ��й�ȣ!!!
		if (exist == null) {
			return null; // �������� �ʴ´�
		} else {
			return exist;
			
//			// �����Ѵٸ�, ��й�ȣ�� Ȯ���غ��� => ������ �ʹ� ���� ��Ʈ�� �༭ ������ �������� ��ȿ��!
//			String encryptedPwd = EncyrptionUtils.encryptSHA256(memberVO.getPassword());
//			String correctPwd = exist.getPassword();
//			
//			if (correctPwd.equals(encryptedPwd)) {
//				return 1;
//			} else {
//				return -2; // ��й�ȣ ����ġ
//			}				
		}
	}
	
	// �α׾ƿ�
	
	
}
