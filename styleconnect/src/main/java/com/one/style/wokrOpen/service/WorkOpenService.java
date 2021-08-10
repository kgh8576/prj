package com.one.style.wokrOpen.service;

import java.util.List;

import com.one.style.files.vo.FilesVO;
import com.one.style.wokrOpen.vo.WorkOpenVO;

public interface WorkOpenService {

	
	public String[] getRealWorkOpenTime(WorkOpenVO vo);
	public FilesVO getFileUuidTest(FilesVO vo);
	public String dateTest();
}
