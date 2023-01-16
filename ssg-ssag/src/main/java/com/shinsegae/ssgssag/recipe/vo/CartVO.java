package com.shinsegae.ssgssag.recipe.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
	
	private String user_no;
	private String ing_id;
	private String ing_name;
	private Date update_date;
	private boolean iisNew;
}
