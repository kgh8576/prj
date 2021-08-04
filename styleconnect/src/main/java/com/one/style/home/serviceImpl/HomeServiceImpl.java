package com.one.style.home.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.crawldata.vo.CrawlDataVO;
import com.one.style.home.mapper.HomeServiceMap;
import com.one.style.home.service.HomeService;
import com.one.style.home.vo.HomeVO;

@Repository("homeDao")
public class HomeServiceImpl implements HomeService{

	@Autowired HomeServiceMap map;

	@Override
	public List<HomeVO> ajaxTopDesInfo(String keyword) {
		return map.ajaxTopDesInfo(keyword);
	}

	@Override
	public List<HomeVO> ajaxTopDesCount(String keyword) {
		return map.ajaxTopDesCount(keyword);
	}

	
}
