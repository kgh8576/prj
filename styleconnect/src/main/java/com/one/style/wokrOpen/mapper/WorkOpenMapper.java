package com.one.style.wokrOpen.mapper;

import com.one.style.wokrOpen.vo.WorkOpenVO;

public interface WorkOpenMapper {

	public String getWorkOpenTime(WorkOpenVO vo);
	public String getReservationTime(WorkOpenVO vo);
	public String getWorkCloseTime(WorkOpenVO vo);
	
}
