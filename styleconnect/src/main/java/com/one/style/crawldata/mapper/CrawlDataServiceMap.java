package com.one.style.crawldata.mapper;

import java.util.List;

import com.one.style.crawldata.vo.CrawlDataVO;

public interface CrawlDataServiceMap {
	 public void initCrawl(String gender);
	 public void runCrawl();
	 public void splitTest(String crawlText);
	 public void start(String gender);
	 void insertCrawl(CrawlDataVO vo);
	 CrawlDataVO getCrawlList(String gender);
	 List<CrawlDataVO> getCrawlData1Row();
}
