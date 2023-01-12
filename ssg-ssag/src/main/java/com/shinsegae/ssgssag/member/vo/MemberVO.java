package com.shinsegae.ssgssag.member.vo;

public class MemberVO {
	
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String reg_date;
	private String birth_date;
	private int gender;
	
    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getPassword() {
		return password;
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
    private String check_password;

	public String getCheck_id() {
		return check_id;
	}

	public void setCheck_id(String check_id) {
		this.check_id = check_id;
	}

	public String getCheck_password() {
		return check_password;
	}

	public void setCheck_password(String check_password) {
		this.check_password = check_password;
	}
    
    
}
