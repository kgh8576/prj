package com.one.style.des.vo;

import java.util.Date;

import lombok.Data;

@Data
public class DesVO {

	private String id;
	private String pw;
	private String name;
	private String Hp;
	private String location;
	private String gender;
	private String birth;
	private int point;
	private String state;
	private String career;
	private String regday;
	private String majorgender;
	private String makeupyn;
	private String cutyn;
	private String permyn;
	private String dyeyn;
	private String major;
	private String comments;
	private String title;
	private String detail;
	private int price;
	private int courNo;
	
	//file
	private int fileNo;
	private String fileState;
	private String fileUuid;
	
	//work_close
	private int wcloseNo;
	private Date closeDay;
	private String closeTime;
	
	//work_open
	private String mon;
	private String tue;
	private String wed;
	private String thu;
	private String fri;
	private String sat;
	private String sun;
	
}
