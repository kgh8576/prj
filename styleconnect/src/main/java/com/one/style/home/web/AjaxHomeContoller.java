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

	@RequestMapping("ajaxTopHairDesChange.do")
	public List<HomeVO> getHairDesTop(@RequestParam("keyword") String keyword) {
		List<HomeVO> list = homeDao.ajaxTopHairDes(keyword);
		return list;
	}
	
}
