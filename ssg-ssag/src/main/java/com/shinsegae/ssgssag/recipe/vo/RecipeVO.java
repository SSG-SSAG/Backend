package com.shinsegae.ssgssag.recipe.vo;

import lombok.Data;

@Data
public class RecipeVO {

	// Field
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
}
