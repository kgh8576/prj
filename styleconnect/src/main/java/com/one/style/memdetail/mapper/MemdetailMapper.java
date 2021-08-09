package com.one.style.memdetail.mapper;

import java.util.List;

import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.mem.vo.MemberVO;

public interface MemdetailMapper {

	public void hpchange(MemberVO vo);
	public void pwchange(MemberVO vo);
	public List<ConHistoryVO> conhisList(ConHistoryVO vo);
	public List<ConHistoryVO> conhisListend(ConHistoryVO vo);
	public void memexit(MemberVO vo);
	public String getCancleDate(ConHistoryVO vo); 
	public void reservationcancle(ConHistoryVO vo);
	
}
