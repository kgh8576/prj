package com.one.style.home.service;

import java.util.List;

import com.one.style.home.vo.HomeVO;

public interface HomeService {
	
	public List<HomeVO> ajaxTopDesInfo(String keyword);
	public List<HomeVO> ajaxTopDesCount(String keyword);
}
