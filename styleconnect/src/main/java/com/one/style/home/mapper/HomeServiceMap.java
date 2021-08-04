package com.one.style.home.mapper;

import java.util.List;

import com.one.style.home.vo.HomeVO;
import com.one.style.mem.vo.MemDetailVO;

public interface HomeServiceMap {

	public List<HomeVO> ajaxTopDesInfo(String keyword);
	public List<HomeVO> ajaxTopDesCount(String keyword);
	public MemDetailVO memDetail(String id);
	public HomeVO rcmdDesByRate(String id);
	public HomeVO rcmdDesByConHis(String id);
}
