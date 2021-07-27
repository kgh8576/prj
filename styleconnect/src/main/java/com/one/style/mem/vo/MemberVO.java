package com.one.style.mem.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private String id;
	private String pw;
	private String name;
	private String hp;
	private String gender;
	private String birth;
	private int point;
	private Date regday;
	
}
