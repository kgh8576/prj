package com.one.style.memdetail.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.mem.vo.MemberVO;
import com.one.style.memdetail.mapper.MemdetailMapper;
import com.one.style.memdetail.service.MemdetailService;
import com.one.style.review.vo.ReviewVO;

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

	@Override
	public List<ConHistoryVO> conhisListend(ConHistoryVO vo) {
		// TODO Auto-generated method stub
		return detailMapper.conhisListend(vo);
	}

	@Override
	public String getCancleDate(ConHistoryVO vo) {
		// TODO Auto-generated method stub
		return detailMapper.getCancleDate(vo);
	}

	@Override
	public void reservationcancle(ConHistoryVO vo) {
		// TODO Auto-generated method stub
		detailMapper.reservationcancle(vo);
	}

	@Override
	public String reviewyoumu(ReviewVO vo) {
		// TODO Auto-generated method stub
		return detailMapper.reviewyoumu(vo);
	}

	@Override
	public List<ConHistoryVO> conallList(ConHistoryVO vo) {
		// TODO Auto-generated method stub
		return detailMapper.conallList(vo);
	}

	@Override
	public List<ConHistoryVO> conccode005(ConHistoryVO vo) {
		// TODO Auto-generated method stub
		return detailMapper.conccode005(vo);
	}
	

	
}
