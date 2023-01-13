package com.shinsegae.ssgssag.recipe.vo;

import lombok.Data;

@Data
public class RecipeVO {

	/*
	 * Data Field
	 * - ERD �������� ����
	 */
	
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
	
	// Recipe Detail Field
	private int recipe_step_id;		// ������ �� ID
	private int recipe_id3;			// ������ ID
	private int step;				// ����
	private String description;		// ����
	private String dsc_img;			// �̹���
	
	// Like_recipe Field
	private int cnt;				// ��
	
	
	/*
	 * Input Field
	 * - ���� ó���� ���� �ʵ�
	 */
	
	// Input
	private String rname;			// �˻���
	private String type;			// �˻�
	private String sort;			// ����
	
	// ����¡ ó��
	private int amount;
	private int pageNum;
	
	
	private int total_count;
	private int curpage;
	private int start;
	// ������
	public RecipeVO() {				// default
		this.amount = 10;
		this.pageNum = 1;
		this.type = "all";
		this.sort = "name";
		this.curpage = 1;
	}
}
