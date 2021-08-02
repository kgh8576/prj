package com.one.style.review.vo;


import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReviewVO {
	private int conNo;
	private String contents;
	private int rate;
	private Date wDate;
	private String title;
	private String desId;
	private String memId;
	private int count;
	private String state;
	
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
	private String id;
	private String name;
}
