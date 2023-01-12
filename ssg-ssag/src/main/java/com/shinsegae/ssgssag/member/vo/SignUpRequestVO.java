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
	
    @NotBlank(message="¾Æ¾Æµğ´Â ÇÊ¼ö°ªÀÔ´Ï´Ù.")
    private String id;
    
    @NotBlank(message="ºñ¹Ğ¹øÈ£´Â ÇÊ¼ö°ªÀÔ´Ï´Ù.")
//    @Pattern(regexp = "(?=.*\\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{4,16}", message = "4ÀÚ ÀÌ»ó, 16ÀÚ ÀÌÇÏÀÇ ¿µ¹®, ¼ıÀÚ Á¶ÇÕ")
    private String password;
    
    @NotBlank(message="ÀÌ¸§ ÇÊ¼ö°ªÀÔ´Ï´Ù.")
    @Pattern(regexp = "([a-zA-Z0-9¤¡-¤¾|¤¿-¤Ó|°¡-ÆR]).{1,10}", message = "ÇÑ±Û or ¿µ¹®ÀÚ or ¼ıÀÚÀÇ Á¶ÇÕÀ¸·Î 1~10ÀÚ¸®")
    private String name;

    @NotBlank(message="´Ğ³×ÀÓÀº ÇÊ¼ö°ªÀÔ´Ï´Ù.")
    @Pattern(regexp = "([a-zA-Z0-9¤¡-¤¾|¤¿-¤Ó|°¡-ÆR]).{1,10}", message = "ÇÑ±Û or ¿µ¹®ÀÚ or ¼ıÀÚÀÇ Á¶ÇÕÀ¸·Î 1~10ÀÚ¸®")
    private String nickname;
    
    private Date birthdate;
 
    private int gender;
}
