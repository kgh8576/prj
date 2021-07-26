package com.one.style.conhistory.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ConHistorVO {
	private int CON_NO;
	private Date DAY;
	private String TIME;
	private String STATE;
	private int PRICE;
	private Date RESERVATE_DATE;
	private String ID;
	private String MEM_COMMENT;
	private int COUR_NO;
	private String DES_COMMENT;
}
