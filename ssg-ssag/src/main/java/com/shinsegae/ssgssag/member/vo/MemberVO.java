package com.shinsegae.ssgssag.member.vo;

public class MemberVO {
	
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String reg_date;
	private String birth_date;
	private int gender;
	
	public MemberVO() {
	}
	
	public MemberVO (String id, String password, String name, String nickname, 
			String reg_date, String birth_date, int gender) {
		
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.reg_date = reg_date;
		this.birth_date = birth_date;
		this.gender = gender;
	}
	
	
	
    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	// SQL 조회용 변수
    private String check_id;
}
