package com.one.style.wokrOpen.serviceImpl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.wokrOpen.mapper.WorkOpenMapper;
import com.one.style.wokrOpen.service.WorkOpenService;
import com.one.style.wokrOpen.vo.WorkOpenVO;


@Repository("workOpenDao")
public class WorkOpenServiceImpl implements WorkOpenService{

	@Autowired
	WorkOpenMapper workOpenMapper;

	@Override
	public String[] getRealWorkOpenTime(WorkOpenVO vo) {
		String[] openTimes =workOpenMapper.getWorkOpenTime(vo).split(",");
		System.out.println(vo.getSearchDate());
		
//		workOpenMapper.getReservationTime(vo);
//		workOpenMapper.getWorkCloseTime(vo);
		String [] realWrokTime = null;
		return realWrokTime;
	}
	
	
	
	
}
