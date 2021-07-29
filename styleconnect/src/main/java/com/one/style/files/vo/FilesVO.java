package com.one.style.files.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class FilesVO {

	private int fileNo;
	private int desGroupNo;
	private String fileName;
	private String fileUuid;
	private String filePath;
	private String fileState;
	private Date fileRegDate;
	
}
