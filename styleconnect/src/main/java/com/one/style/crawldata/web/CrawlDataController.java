package com.one.style.crawldata.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.one.style.crawldata.service.CrawlDataService;
import com.one.style.crawldata.vo.CrawlDataVO;

@Controller
public class CrawlDataController {

	@Autowired CrawlDataService crawlDao;
	
	@RequestMapping("crawl.do")
	@ResponseBody
	public String crawl(String gender, String id, String pw, HttpServletRequest req){
		HttpSession session = req.getSession();
		session.setAttribute("instaId", id);
		String state = crawlDao.start(gender, id, pw);
		return state;
	}
	
	@RequestMapping("getCrawlData.do")
	@ResponseBody
	public CrawlDataVO getCrawlData(String gender){
		return crawlDao.getCrawlList(gender); 
	}
	
	// 크롤링 중인지 검사
	@RequestMapping("isCrawlRunning.do")
	@ResponseBody
	public boolean isCrawlRunning() {
		return crawlDao.getRunning();
	}
	
	// 크롤링 진행률 가져오기
	@RequestMapping("getCrawlProgress.do")
	@ResponseBody
	public int getCrawlProgress() {
		return crawlDao.getProgress();	
	}
	
	@RequestMapping("crawlManagement.do")
	public String crawlManagement(Model model) {
		model.addAttribute("crawlDatas", crawlDao.getCrawlData1Row());
		return "admin/crawlManagement";
	}
	@RequestMapping("resetCrawlData.do")
	@ResponseBody
	public List<CrawlDataVO> resetCrawlData() {
		return crawlDao.getCrawlData1Row();
	}
}
