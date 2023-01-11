package com.shinsegae.ssgssag.recipe.vo;

import lombok.Data;

@Data
public class RecipeVO {

	// Field
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
	
	// 페이징 처리
	private int amount;
	private int pageNum;
	
	// 생성자
	public RecipeVO() {				// default
		this.amount = 10;
		this.pageNum = 1;
	}
}
