package com.one.style.conhistory.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ConHistoryVO {
	private int conNo;
	private String day;
	private String time;
	private String state;
	private int price;
	private String reservateDate;
	private String memId;
	private String memComment;
	private int courNo;
	private String desComment;
	private String desId;
	private String title;
	private long payNo;
}
