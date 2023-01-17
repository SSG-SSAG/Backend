package com.shinsegae.ssgssag.member.vo;

import lombok.Data;

@Data
public class MyVO {
	
	// User Field
	private int user_no;
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String reg_date;
	private String birth_date;
	private int gender;
	
	// Like Tag Filed
	private int like_tag_id;
	private int tag_id;
	
	// Tag Field
	private int tag_category;
	private String tag_name;
	
	// Tag Category Field
	private int category_id;
	private String category_name;
	
	
	private String mytag;
	
	public MyVO() {				// default
		this.mytag = "1";
	}
    
}
