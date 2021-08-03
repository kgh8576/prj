package com.one.style.home.vo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class HomeVO {
	
	//디자이너 TOP3 분류를 위한 데이터
	private String id;
	private String name;
	private String gender;
	private String majorGender;
	private String major;
	private String makeupYn;
	private String cutYn;
	private String dyeYn;
	private int rate;
	private int count;
	private String fileUuid;
	
}
