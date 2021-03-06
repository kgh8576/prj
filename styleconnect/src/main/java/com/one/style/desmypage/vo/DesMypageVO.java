package com.one.style.desmypage.vo;

import java.util.Date;

import lombok.Data;

@Data
public class DesMypageVO {

	private String id;
	private String pw;
	private String name;
	private String hp;
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

	//file
	private int fileNo;
	private String fileState;
	private String fileUuid;
	private String fileName;
	
	//work_close
	private int wcloseNo;
	private Date closeDay;
	private String closeTime;
	
	//work_open
	private String weeked;
	private String mon;
	private String tue;
	private String wed;
	private String thu;
	private String fri;
	private String sat;
	private String sun;
	private String[] time;
	private String times;
	
	// 페이징 관련
	private int pageCnt;
	private int lastCnt;
	private int firstCnt;
	private String pullValue;
	
	//course
	private String title;
	private String detail;
	private String price;
	private String courNo;
}
