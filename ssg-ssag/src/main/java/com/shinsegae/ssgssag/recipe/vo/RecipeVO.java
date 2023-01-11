package com.shinsegae.ssgssag.recipe.vo;

import lombok.Data;

@Data
public class RecipeVO {

	// Recipe Field
	private int recipe_id;			// ������ ID
	private String recipe_name;		// ������ �̸�
	private String recipe_img;		// ��ǥ �̹���
	private int calorie;			// ����
	private int info_car;			// ź��ȭ��
	private int info_pro;			// �ܹ���
	private int info_fat;			// ����
	private int info_na;			// ��Ʈ��
	private String source;			// ��ó
	private int level;				// ���̵�
	private String recipe_ing_info;	// ��� ����
	
	// Recipe Ingredient Field
	private int recipe_ing_id;		// ������ ��� ID
	private int recipe_id2;			// ������ ID
	private int ing_id2;			// ��� ID
	private char recipe_capacity;	// �뷮
	
	// Ingredients Field
	private int ing_id;				// ��� ID
	private String ing_name;		// ����
	
	// Input
	private String rname;
	private String iname;
	
	// ����¡ ó��
	private int amount;
	private int pageNum;
	
	// ������
	public RecipeVO() {				// default
		this.amount = 10;
		this.pageNum = 1;
	}
}
