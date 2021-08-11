package com.one.style.crawldata.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.one.style.crawldata.service.CrawlDataService;
import com.one.style.crawldata.vo.CrawlDataVO;

@RestController
public class CrawlDataController {

	@Autowired CrawlDataService crawlDao;
	
	@RequestMapping("crawl.do")
	public String crawl(String gender){
		crawlDao.start(gender);
		return null;
	}
	
	@RequestMapping("getCrawlData.do")
	@ResponseBody
	public CrawlDataVO getCrawlData(String gender){
		return crawlDao.getCrawlList(gender); 
	}
	
	
}
