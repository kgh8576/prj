package com.one.style.dessearch.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class DessearchVO {
	//designer
	private String id;
	private String pw;
	private String name;
	private String career;
	private String majorGender;
	private String makeupYN;
	private String cutYN;
	private String permYN;
	private String dyeYN;
	private String major;
	private String[] majors;
	//review
	private int conNo;
	private String contents;
	private int rate;
	private Date wDate;
	private String title;
	private String reviewCnt;
	//course
	private int courNo;
	private String Ctitle;
	private String detail;
	private String price;
	//검색
	private String search;
	//member
	private String mName;
	//files
	private String fileUuid;
	private String fileState;
}
