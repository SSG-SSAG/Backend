package com.shinsegae.ssgssag.recipe.vo;

import lombok.Data;

@Data
public class RecipeVO {

	// Recipe Field
	private int recipe_id;			// 레시피 ID
	private String recipe_name;		// 레시피 이름
	private String recipe_img;		// 대표 이미지
	private int calorie;			// 열량
	private int info_car;			// 탄수화물
	private int info_pro;			// 단백질
	private int info_fat;			// 지방
	private int info_na;			// 나트륨
	private String source;			// 출처
	private int level;				// 난이도
	private String recipe_ing_info;	// 재료 정보
	
	// Recipe Ingredient Field
	private int recipe_ing_id;		// 레시피 재료 ID
	private int recipe_id2;			// 레시피 ID
	private int ing_id2;			// 재료 ID
	private char recipe_capacity;	// 용량
	
	// Ingredients Field
	private int ing_id;				// 재료 ID
	private String ing_name;		// 재료명
	
	// Input
	private String rname;
	private String iname;
	
	// 페이징 처리
	private int amount;
	private int pageNum;
	
	private String type;
	
	// 생성자
	public RecipeVO() {				// default
		this.amount = 10;
		this.pageNum = 1;
	}
}