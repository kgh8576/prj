package com.one.style.dessearch.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class DessearchVO {
	//designer
	private String id;
	private String pw;
	private String name;
	private String location;
	private String gender;
	private String state;
	private String career;
	private String majorGender;
	private String makeupYN;
	private String cutYN;
	private String permYN;
	private String dyeYN;
	private String major;
	private int imgGroupNo;
	private int cerGroupNo;
	private String[] majors;
	//review
	private int conNo;
	private String contents;
	private int rate;
	private Date wDate;
//	private String title;
	//course
	private int courNo;
	private String title;
	private String detail;
	private String price;
	
	private String search;
	
}
