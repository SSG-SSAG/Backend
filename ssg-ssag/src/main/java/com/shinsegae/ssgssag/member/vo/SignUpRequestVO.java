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
	
    @NotBlank(message="아아디는 필수값입니다.")
    private String id;
    
    @NotBlank(message="비밀번호는 필수값입니다.")
//    @Pattern(regexp = "(?=.*\\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{4,16}", message = "4자 이상, 16자 이하의 영문, 숫자 조합")
    private String password;
    
    @NotBlank(message="이름 필수값입니다.")
    @Pattern(regexp = "([a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-R]).{1,10}", message = "한글 or 영문자 or 숫자의 조합으로 1~10자리")
    private String name;

    @NotBlank(message="닉네임은 필수값입니다.")
    @Pattern(regexp = "([a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-R]).{1,10}", message = "한글 or 영문자 or 숫자의 조합으로 1~10자리")
    private String nickname;
    
    private Date birthdate;
 
    private int gender;
}