package com.one.style.mem.vo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MemDetailVO {
	private String location;
	private String makeupYn;
	private String cutYn;
	private String permYn;
	private String dyeYn;
	private String likeStyle;
	private String id;
	
	//조인용
	private String gender;
	//
	private int count;
}
