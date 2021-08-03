package com.one.style.conhistory.mapper;

import java.util.List;

import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.des.vo.DesVO;

public interface ConhistoryMapper {
	public List<ConHistoryVO> conHistoryList(ConHistoryVO vo);
	public DesVO desCourseDetail(ConHistoryVO vo);
	public int conHistoryInsert(ConHistoryVO vo);
	public int seqTest();
}
