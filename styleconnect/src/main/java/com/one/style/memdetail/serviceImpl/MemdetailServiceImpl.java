package com.one.style.memdetail.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.mem.vo.MemberVO;
import com.one.style.memdetail.mapper.MemdetailMapper;
import com.one.style.memdetail.service.MemdetailService;

@Repository
public class MemdetailServiceImpl implements MemdetailService {

	@Autowired
	MemdetailMapper detailMapper;
	
	@Override
	public void hpchange(MemberVO vo) {
		System.out.println("매퍼실행됌");
		detailMapper.hpchange(vo);
	}

}
