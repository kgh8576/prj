package com.one.style.home.service;

import java.util.List;

import com.one.style.home.vo.HomeVO;

public interface HomeService {
	
	public List<HomeVO> ajaxTopHairDes(String keyword);
	public List<HomeVO> ajaxTopHairDesCount(String keyword);
}
