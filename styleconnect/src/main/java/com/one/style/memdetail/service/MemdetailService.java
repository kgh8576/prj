package com.one.style.memdetail.service;

import java.util.List;

import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.mem.vo.MemberVO;

public interface MemdetailService {

	public void hpchange(MemberVO vo);
	public void pwchange(MemberVO vo);
	public List<ConHistoryVO> conhisList(ConHistoryVO vo);
}
