package com.one.style.home.mapper;

import java.util.List;

import com.one.style.home.vo.HomeVO;

public interface HomeServiceMap {

	public List<HomeVO> ajaxTopHairDes(String keyword);
	public List<HomeVO> ajaxTopHairDesCount(String keyword);
}
