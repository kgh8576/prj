package com.one.style.memdetail.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.mem.vo.MemberVO;
import com.one.style.memdetail.mapper.MemdetailMapper;
import com.one.style.memdetail.service.MemdetailService;

@Repository
public class MemdetailServiceImpl implements MemdetailService {

	@Autowired
	MemdetailMapper detailMapper;
	
	@Override
	public void hpchange(MemberVO vo) {

		detailMapper.hpchange(vo);
	}

	@Override
	public void pwchange(MemberVO vo) {
		// TODO Auto-generated method stub
		detailMapper.pwchange(vo);
	}

	@Override
	public List<ConHistoryVO> conhisList(ConHistoryVO vo) {
		// TODO Auto-generated method stub
		return detailMapper.conhisList(vo);
	}

	@Override
	public void memexit(MemberVO vo) {
		// TODO Auto-generated method stub
		detailMapper.memexit(vo);
	}

	
}
