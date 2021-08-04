package com.one.style.home.service;

import java.util.List;

import com.one.style.home.vo.HomeVO;
import com.one.style.mem.vo.MemDetailVO;

public interface HomeService {
	
	public List<HomeVO> ajaxTopDesInfo(String keyword);
	public List<HomeVO> ajaxTopDesCount(String keyword);
	public MemDetailVO memDetail(String id);
	public HomeVO rcmdDesByRate(String id);
	public HomeVO rcmdDesByConHis(String id);
}
