package com.shinsegae.ssgssag.recipe.vo;

import lombok.Data;

@Data
public class RecipeVO {

	/*
	 * Data Field
	 * - ERD 기준으로 정의
	 */
	
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
	private char recipe_capacity;	// 용량
	
	// Ingredients Field
	private int ing_id;				// 재료 ID
	private String ing_name;		// 재료명
	
	// Recipe Detail Field
	private int recipe_step_id;		// 레시피 상세 ID
	private int step;				// 순서
	private String description;		// 설명
	private String dsc_img;			// 이미지
	
	// Like_recipe Field
	private int cnt;				// 찜
	
	// Tag Field
	private int tag_id;				// 태그 ID
	private int tag_category;		// 대분류
	private String tag_name;		// 태그명
	
	// Tag Category Field
	private int category_id;		// 대분류 ID
	private String category_name;	// 대분류명
	
	// Recipe Tag Filed
	private int recipe_tag_id;		// 레시피 태그 번호
	
	
	/*
	 * Input Field
	 * - 동적 처리를 위한 필드
	 */
	
	// Input
	private String rname;			// 검색어
	private String type;			// 검색
	private String sort;			// 정렬
	private int cat;				// 카테고리 대분류
	
	// 페이징 처리
	private int amount;
	private int pageNum;
	
	// 생성자
	private int total_count;
	private int curpage;
	private int start;
	public RecipeVO() {				// default
		this.amount = 10;
		this.pageNum = 1;
		this.type = "all";
		this.sort = "name";
		this.curpage = 1;
	}
}
