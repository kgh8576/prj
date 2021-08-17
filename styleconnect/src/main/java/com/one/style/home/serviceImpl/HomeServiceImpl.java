package com.one.style.home.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.crawldata.vo.CrawlDataVO;
import com.one.style.home.mapper.HomeServiceMap;
import com.one.style.home.service.HomeService;
import com.one.style.home.vo.HomeVO;
import com.one.style.mem.vo.MemDetailVO;

@Repository("homeDao")
public class HomeServiceImpl implements HomeService{

	@Autowired HomeServiceMap map;

	@Override
	public List<HomeVO> ajaxTopDesInfo(String keyword) {
		return map.ajaxTopDesInfo(keyword);
	}

	@Override
	public MemDetailVO memDetail(String id) {
		return map.memDetail(id);
	}

	//메인페이지 추천 디자이너 별점 수 기준
	@Override
	public HomeVO rcmdDesByRate(MemDetailVO vo) {
		return map.rcmdDesByRate(vo);
	}

	//메인페이지 추천 디자이너 내역 수 기준
	@Override
	public HomeVO rcmdDesByConHis(MemDetailVO vo) {
		return map.rcmdDesByConHis(vo);
	}

	@Override
	public void memDetailInsert(MemDetailVO vo) {
		map.memDetailInsert(vo);
	}

	@Override
	public List<HomeVO> searchKeywordsList() {
		return map.searchKeywordsList();
	}


	
}
