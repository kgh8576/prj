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
	private String memAttend;
	private String desAttend;
	
	private String desName; //디자이너 이름
	private String detail; //코스 상세정보
	private int remainingTime; //남은 상담 시간
	private String memName;
	private String id; //디자이너 아이디
	private int reviewexist; //리뷰 유무
	private int canreview; //리뷰3일이내
	private int canmodify;//리뷰수정가능한가? 가능 1 or 0
	
	private String codecontent; //예약상황
	private String major; //디자이너 전문분야
	private String career; //디자이너 커리어
	private String laststDate; //예약시간
	private String cancleDate; //예약취소
	// 페이징 관련
	private int pageCnt;
	private int lastCnt;
	private int firstCnt;
	private String pullValue;
	//파일
	private String fileUuid;
}
