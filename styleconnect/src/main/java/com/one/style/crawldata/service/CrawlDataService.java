package com.one.style.crawldata.service;

import java.util.List;

import com.one.style.crawldata.vo.CrawlDataVO;

public interface CrawlDataService {
	
	 public void initCrawl(String gender);
	 public void runCrawl();
	 public void splitTest(String crawlText);
	 public void start(String gender);
	 void insertCrawl(CrawlDataVO vo);
	 CrawlDataVO getCrawlList(String gender);
	 
	 public int getProgress();
	 public void setProgress(int progress);
	 public boolean getRunning();
	 public void setRunning(boolean running);
	 
}
