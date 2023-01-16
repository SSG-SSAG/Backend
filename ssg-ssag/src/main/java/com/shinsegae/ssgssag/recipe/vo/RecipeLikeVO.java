package com.shinsegae.ssgssag.recipe.vo;

public class RecipeLikeVO {

	private int like_id;			// like_recipe PK
	
	
	private int recipe_id;			// 레시피 ID
	private String recipe_name;		// 레시피 이름
	
	private int user_no;			// 유저 번호
	private String id;				// 유저 아이디
	
	
	public int getLike_id() {
		return like_id;
	}
	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}
	public int getRecipe_id() {
		return recipe_id;
	}
	public void setRecipe_id(int recipe_id) {
		this.recipe_id = recipe_id;
	}
	public String getRecipe_name() {
		return recipe_name;
	}
	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
