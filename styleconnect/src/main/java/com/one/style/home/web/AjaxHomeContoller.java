package com.one.style.home.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.one.style.home.service.HomeService;
import com.one.style.home.vo.HomeVO;

@RestController
public class AjaxHomeContoller {
	
	@Autowired HomeService homeDao; 

	// 카테고리별 top3 디자이너 이름, 평점, 파일경로 가져오는 쿼리
	@RequestMapping("ajaxTopHairDesChange.do")
	public List<HomeVO> getHairDesTop(@RequestParam("keyword") String keyword) {
		List<HomeVO> list = homeDao.ajaxTopHairDes(keyword);
		return list;
	}
	
	// 총 리뷰 수 카운트 쿼리
	@RequestMapping("ajaxTopHairDesCount.do")
	public List<HomeVO> getHairDesTopCount(@RequestParam("keyword") String keyword) {
		List<HomeVO> list = homeDao.ajaxTopHairDesCount(keyword);
		return list;
	}
}
