package com.one.style.review.vo;


import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReviewVO {
	private String conNo;
	private String contents;
	private int rate;
	private Date wDate;
	private String title;
	private String desId;
	private String memId;
	private int count;
	
	//페이징 관련
	private int firstCnt;
	private int lastCnt;
	private String pullValue;
	private int rn;
	
	//조인 관련
	private String courNo;
	private int price;
	private String reviewTitle;
	private String stringwDate;
	
}
