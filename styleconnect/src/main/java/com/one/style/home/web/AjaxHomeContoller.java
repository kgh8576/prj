package com.one.style.home.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.one.style.crawldata.service.CrawlDataService;
import com.one.style.crawldata.vo.CrawlDataVO;
import com.one.style.home.service.HomeService;
import com.one.style.home.vo.HomeVO;
import com.one.style.mem.vo.MemDetailVO;

@RestController
public class AjaxHomeContoller {
	
	@Autowired HomeService homeDao;
	

	// 카테고리별 top3 디자이너 이름, 총 리뷰수, 평점, 파일경로 가져오는 쿼리
	@RequestMapping("ajaxTopDesChange.do")
	public List<HomeVO> getDesTop(@RequestParam("keyword") String keyword) {
		List<HomeVO> list = homeDao.ajaxTopDesInfo(keyword);
		return list;
	}

	@RequestMapping("memDetailInsert.do")
	public String memDetailInsert(MemDetailVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		vo.setId((String)session.getAttribute("id"));
		homeDao.memDetailInsert(vo);
		return "정상적으로 입력되었습니다";
	}
	

}
