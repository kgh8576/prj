package com.one.style.crawldata.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.one.style.crawldata.service.CrawlDataService;
import com.one.style.crawldata.vo.CrawlDataVO;

@RestController
public class CrawlDataController {

	@Autowired CrawlDataService crawlDao;
	
	@RequestMapping("crawl.do")
	public String crawl(){
		crawlDao.start();
		return null;
	}
	
	@RequestMapping("getCrawlData.do")
	public List<CrawlDataVO> getCrawlData(){
		return crawlDao.getCrawlList(); 
	}
	
	
}
