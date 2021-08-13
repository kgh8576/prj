package com.one.style.memdetail.service;

import java.util.List;

import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.mem.vo.MemberVO;
import com.one.style.review.vo.ReviewVO;

public interface MemdetailService {

	public void hpchange(MemberVO vo);
	public void pwchange(MemberVO vo);
	public List<ConHistoryVO> conhisList(ConHistoryVO vo);
	public List<ConHistoryVO> conhisListend(ConHistoryVO vo);
	public List<ConHistoryVO> conallList(ConHistoryVO vo);
	public List<ConHistoryVO> conccode005(ConHistoryVO vo);
	public void memexit(MemberVO vo);
	public String getCancleDate(ConHistoryVO vo);
	public void reservationcancle(ConHistoryVO vo);
	public String reviewyoumu(ReviewVO vo);
}
