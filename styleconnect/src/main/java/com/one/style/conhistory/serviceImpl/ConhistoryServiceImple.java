package com.one.style.conhistory.serviceImpl;

<<<<<<< HEAD
import java.util.List;
=======
import org.springframework.stereotype.Repository;

import com.one.style.conhistory.service.ConhistoryService;
>>>>>>> branch 'main' of https://github.com/kgh8576/prj.git

<<<<<<< HEAD
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.conhistory.mapper.ConhistoryMapper;
import com.one.style.conhistory.service.ConhistoryService;
import com.one.style.conhistory.vo.ConHistorVO;

=======
>>>>>>> branch 'main' of https://github.com/kgh8576/prj.git
@Repository("conHistoryDao")
public class ConhistoryServiceImple implements ConhistoryService {
	@Autowired
	ConhistoryMapper conHistoryMapper;
	
	@Override
	public List<ConHistorVO> conhistoryList(ConHistorVO vo) {
		
		List<ConHistorVO> conHistoryList = conHistoryMapper.conHistoryList(vo);
		
		return conHistoryList;
	}

}
