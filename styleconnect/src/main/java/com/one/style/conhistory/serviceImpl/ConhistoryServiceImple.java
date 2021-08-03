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
	
	@Override
	public List<ConHistoryVO> conhistoryList(ConHistoryVO vo) {
		List<ConHistoryVO> conHistoryList = conHistoryMapper.conHistoryList(vo);
		return conHistoryList;
	}
	public DesVO desCourseDetail(ConHistoryVO vo) {
		return conHistoryMapper.desCourseDetail(vo);
	}
	@Override
	public int conHistoryInsert(ConHistoryVO vo) {
		conHistoryMapper.conHistoryInsert(vo);
		return 0;
	}

}
