package com.one.style.wokrOpen.serviceImpl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
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
		String[] openTimes = workOpenMapper.getWorkOpenTime(vo).split(",");
		
		
		Collection<String> openTimeColl = new ArrayList(Arrays.asList(openTimes));
		Collection<String> reserTimeColl = null;
		Collection<String> closeTimeColl = null;
		
		List<String> openTimeList = new ArrayList<String>(openTimeColl);
		String[] reserTime = workOpenMapper.getReservationTime(vo);
		
		if (reserTime != null) {
			reserTimeColl = new ArrayList(Arrays.asList(reserTime));
			openTimeList.removeAll(reserTimeColl);
		}
		
		String[] closeTime = workOpenMapper.getWorkCloseTime(vo);
		if (closeTime != null) {
			closeTimeColl = new ArrayList(Arrays.asList(closeTime));
			openTimeList.removeAll(closeTimeColl);
		}
		
		String[] realWrokTime = openTimeList.toArray(new String[openTimeList.size()]);
		return realWrokTime;
	}
	
	
	
	
}
