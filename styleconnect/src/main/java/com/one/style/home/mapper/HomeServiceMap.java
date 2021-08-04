package com.one.style.home.mapper;

import java.util.List;

import com.one.style.home.vo.HomeVO;

public interface HomeServiceMap {

	public List<HomeVO> ajaxTopDesInfo(String keyword);
	public List<HomeVO> ajaxTopDesCount(String keyword);
}
