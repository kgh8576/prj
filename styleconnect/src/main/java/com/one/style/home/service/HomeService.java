package com.one.style.home.service;

import java.util.List;
import java.util.Map;

import com.one.style.home.vo.HomeVO;
import com.one.style.mem.vo.MemDetailVO;

public interface HomeService {
	
	public List<HomeVO> ajaxTopDesInfo(String keyword);
	public MemDetailVO memDetail(String id);
	public HomeVO rcmdDesByRate(MemDetailVO vo);
	public HomeVO rcmdDesByConHis(MemDetailVO vo);
	void memDetailInsert(MemDetailVO vo);
	public List<HomeVO> searchKeywordsList();
}
