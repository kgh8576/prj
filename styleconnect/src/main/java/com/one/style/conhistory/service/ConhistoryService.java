package com.one.style.conhistory.service;

import java.util.List;

import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.des.vo.DesVO;

public interface ConhistoryService {
	//상담하기 페이지: 상담 내역 리스트 반환
	public List<ConHistoryVO> conhistoryList(ConHistoryVO vo);
	public DesVO desCourseDetail(ConHistoryVO vo);
	public int conHistoryInsert(ConHistoryVO vo);
	//상담하기 페이지: 상담 참여 시 DB의 consulting_history 테이블의 mem_attend 또는 des_attend 값을 N에서 Y로 변경
	public int conHistoryAttendUpdate(ConHistoryVO vo);
}
