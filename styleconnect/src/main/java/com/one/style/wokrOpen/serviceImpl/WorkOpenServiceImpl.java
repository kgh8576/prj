package com.one.style.wokrOpen.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.wokrOpen.mapper.WorkOpenMapper;
import com.one.style.wokrOpen.service.WorkOpenService;
import com.one.style.wokrOpen.vo.WorkOpenVO;


@Repository("workOpenDao")
public class WorkOpenServiceImpl implements WorkOpenService{

	@Autowired
	WorkOpenMapper workOpenMapper;

	@Override
	public String getWorkOpenTime(WorkOpenVO vo) {
		return workOpenMapper.gerWorkOpenTime(vo);
	}
	
	
	
	
}
