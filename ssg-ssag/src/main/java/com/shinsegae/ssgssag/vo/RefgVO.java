package com.shinsegae.ssgssag.vo;

import java.util.Date;

import lombok.Data;

@Data
public class RefgVO {
	
	private int refg_id;
	private int ing_id;
	private String ing_name;
	private Date expire_date;
	private int remain_day;
	private int remain_hour;
	private boolean over;
}
