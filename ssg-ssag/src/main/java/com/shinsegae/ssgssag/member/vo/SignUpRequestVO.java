package com.shinsegae.ssgssag.member.vo;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class SignUpRequestVO {
	
    @NotBlank(message="�ƾƵ�� �ʼ����Դϴ�.")
    private String id;
    
    @NotBlank(message="��й�ȣ�� �ʼ����Դϴ�.")
//    @Pattern(regexp = "(?=.*\\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{4,16}", message = "4�� �̻�, 16�� ������ ����, ���� ����")
    private String password;
    
    @NotBlank(message="�̸� �ʼ����Դϴ�.")
    @Pattern(regexp = "([a-zA-Z0-9��-��|��-��|��-�R]).{1,10}", message = "�ѱ� or ������ or ������ �������� 1~10�ڸ�")
    private String name;

    @NotBlank(message="�г����� �ʼ����Դϴ�.")
    @Pattern(regexp = "([a-zA-Z0-9��-��|��-��|��-�R]).{1,10}", message = "�ѱ� or ������ or ������ �������� 1~10�ڸ�")
    private String nickname;
    
    private Date birthdate;
 
    private int gender;
}
