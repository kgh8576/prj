package com.one.style.mem.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.mem.mapper.MemMapper;
import com.one.style.mem.service.MemService;
import com.one.style.mem.vo.MemberVO;

@Repository("memDao")
public class MemServiceImpl implements MemService {

	@Autowired
	MemMapper memMapper;
	
	
	@Override
	public List<MemberVO> memList() {
		return memMapper.memList();
	}

}
