package com.one.style.files.vo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.files.mapper.FilesServiceMap;
import com.one.style.files.service.FilesService;

@Repository("filesDao")
public class FilesServiceImpl implements FilesService {
	
	@Autowired FilesServiceMap map;

	
}
