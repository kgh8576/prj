package com.one.style.conhistory.service;

import java.util.List;

import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.des.vo.DesVO;

public interface ConhistoryService {
	public List<ConHistoryVO> conhistoryList(ConHistoryVO vo);
	public DesVO desCourseDetail(ConHistoryVO vo);
	public int conHistoryInsert(ConHistoryVO vo);
	public int seqTest();
}
