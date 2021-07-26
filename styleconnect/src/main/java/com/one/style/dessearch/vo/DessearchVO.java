package com.one.style.dessearch.vo;

import java.sql.Clob;
import java.sql.Date;

import lombok.Data;
@Data
public class DessearchVO {
	private String id;
	private String pw;
	private String name;
	private String hp;
	private String location;
	private String gender;
	private Date birth;
	private int point;
	private String state;
	private String career;
	private Date regDay;
	private String majorGender;
	private String makeupYN;
	private String cutYN;
	private String permYN;
	private String dyeYN;
	private String major;
	private int imgGroupNo;
	private String comments;
	//review
	private int conNo;
	private Clob contents;
	private int rate;
	private Date wDate;
	private String title;
	
}
