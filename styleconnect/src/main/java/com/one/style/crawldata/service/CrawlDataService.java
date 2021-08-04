package com.one.style.crawldata.service;

import java.util.List;

import com.one.style.crawldata.vo.CrawlDataVO;

public interface CrawlDataService {
	 public void initCrawl();
	 public void runCrawl();
	 public void splitTest(String crawlText);
	 public void start();
	 void insertCrawl(CrawlDataVO vo);
	 List<CrawlDataVO> getCrawlList();
}
