package com.one.style.conhistory.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.one.style.conhistory.mapper.ConhistoryMapper;
import com.one.style.conhistory.service.ConhistoryService;
import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.des.vo.DesVO;

@Service
public class ConhistoryServiceImple implements ConhistoryService {
	@Autowired
	ConhistoryMapper conHistoryMapper;
	
	//상담하기 페이지: 상담 내역 리스트 반환
	@Override
	public List<ConHistoryVO> conhistoryList(ConHistoryVO vo) {
		
		return conHistoryMapper.conHistoryList(vo);
	}
	public DesVO desCourseDetail(ConHistoryVO vo) {
		return conHistoryMapper.desCourseDetail(vo);
	}
	@Override
	public int conHistoryInsert(ConHistoryVO vo) {
		conHistoryMapper.conHistoryInsert(vo);
		return 0;
	}
	
	//상담하기 페이지: 상담 참여 시 DB의 consulting_history 테이블의 mem_attend 또는 des_attend 값을 N에서 Y로 변경
	@Override
	public int conHistoryAttendUpdate(ConHistoryVO vo) {
		
		return conHistoryMapper.conHistoryAttendUpdate(vo);
	}

}
