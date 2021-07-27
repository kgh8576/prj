package com.one.style.review.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReviewVO {
	private String conNo;
	private String contents;
	private int rate;
	private Date wDate;
	private String title;
	private String name;
	private int count;
	
	//페이징 관련
	private int firstCnt;
	private int lastCnt;
	private String pullValue;
}
