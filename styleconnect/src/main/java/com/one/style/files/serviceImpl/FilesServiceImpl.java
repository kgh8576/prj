package com.one.style.files.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.files.mapper.FilesMapper;
import com.one.style.files.service.FilesService;
import com.one.style.files.vo.FilesVO;

@Repository("filesDao")
public class FilesServiceImpl implements FilesService {
	
	@Autowired 
	FilesMapper map;

	@Override
	public int cerGroupNo() {
		return map.cerGroupNo();
	}

	@Override
	public void fileinsert(FilesVO vo) {
		map.fileinsert();
		
	}

	
}
