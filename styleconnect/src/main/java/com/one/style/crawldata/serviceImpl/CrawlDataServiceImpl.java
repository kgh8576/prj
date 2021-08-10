package com.one.style.crawldata.serviceImpl;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Repository;


import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;

import com.one.style.crawldata.mapper.CrawlDataServiceMap;
import com.one.style.crawldata.service.CrawlDataService;
import com.one.style.crawldata.vo.CrawlDataVO;
import com.one.style.home.mapper.HomeServiceMap;
import com.one.style.home.service.HomeService;

import java.util.Set;

@Repository("crawlDao")
public class CrawlDataServiceImpl implements CrawlDataService{
	
	@Autowired CrawlDataServiceMap map;

    //WebDriver
    private WebDriver driver;
    //Properties
    public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static final String WEB_DRIVER_PATH = "C:\\Users\\admin\\git\\prj\\styleconnect\\src\\main\\webapp\\resources\\chromedriver.exe";
    //크롤링 할 URL
    private String base_url;
	
    public void start() {
        initCrawl();
        runCrawl();
    }
 
    @Override
    public void initCrawl() {
        //System Property SetUp
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
        //Driver SetUp
        ChromeOptions chromeOptions = new ChromeOptions();
        chromeOptions.addArguments("--disable-gpu","-no-sandbox");
        chromeOptions.addArguments("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36");
        chromeOptions.addArguments("lang=ko_KR");
        driver = new ChromeDriver(chromeOptions);
        base_url = "https://www.instagram.com/accounts/login/";
        try {
        	driver.manage().window().maximize();
        	driver.get(base_url);
        	Thread.sleep(5000);
        	driver.findElement(By.cssSelector("#loginForm > div > div:nth-child(1) > div > label > input")).sendKeys("internet2dot02021"); // 로그인 비번
        	driver.findElement(By.cssSelector("#loginForm > div > div:nth-child(2) > div > label > input")).sendKeys("crawlcrawl"); // 로그인 비밀번호
        	driver.findElement(By.cssSelector("#loginForm > div > div:nth-child(3) > button")).click();
        	Thread.sleep(8000);
        	driver.get("https://www.instagram.com/explore/tags/%EB%82%A8%EC%9E%90%EB%A8%B8%EB%A6%AC/"); // tag/남자태그/ 로 이동
        	Thread.sleep(10000);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public void runCrawl() {
    	String crawlText = "";
    	try {
        	WebElement mainDiv = driver.findElement(By.xpath("/html/body/div[1]/div/div/section/main/article/div[2]/div/div[1]/div[1]/a/div")); // 페이지에서 클릭해줄 div를 가져오는 과정
        	Thread.sleep(500);
    		mainDiv.click();
    		Thread.sleep(7000);
    		for(int i=1; i <= 50; i++) {
    			System.out.println(i + " Times try");
//    			System.out.println(driver.findElement(By.xpath("/html/body/div[5]/div[2]/div/article/div[3]/div[1]")).getText()); // 본문 내용
    			crawlText += driver.findElement(By.xpath("/html/body/div[6]/div[2]/div/article/div[3]/div[1]")).getText();
    			Thread.sleep(500);
    			driver.findElement(By.xpath("/html/body/div[6]/div[1]/div/div/a[2]")).click(); // 다음 게시글 버튼
				Thread.sleep(5000);	
    		}
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
        	driver.close();
        	splitTest(crawlText); // 데이터 자르고 DB insert 하는 함수
        }
    	
    }
    
    @Override
	public void splitTest(String crawlText){
		
		String planeText = crawlText;
		
		String sliced = planeText.replaceAll("\\r\\n", "");
		String[] sliced2 = sliced.split(" ");
		List<String> hashTags = new ArrayList<String>();
		for(String s : sliced2) {
			if(s.contains("#") && !s.contains("#남자") && !s.contains("#여자") && s.length() < 11){
				if(s.endsWith("펌") || s.endsWith("컷")) {
					hashTags.add(s);
				}
			}
		}
		HashMap<String, Integer> tier = new HashMap<String, Integer>();
		
		Set<String> set = new HashSet<String>(hashTags);
		for (String str : set) {
			tier.put(str.replace("#", ""), Collections.frequency(hashTags, str));
		}
		
		// Map.Entry 리스트 작성
		List<Entry<String, Integer>> list_entries = new ArrayList<Entry<String, Integer>>(tier.entrySet());

		// 비교함수 Comparator를 사용하여 내림 차순으로 정렬
		Collections.sort(list_entries, new Comparator<Entry<String, Integer>>() {
			// compare로 값을 비교
			public int compare(Entry<String, Integer> obj1, Entry<String, Integer> obj2)
			{
				// 내림 차순으로 정렬
				return obj2.getValue().compareTo(obj1.getValue());
			}
		});

		System.out.println("내림 차순 정렬");
		CrawlDataVO vo = new CrawlDataVO();
		for(int i = 0; i <= 4; i++) {
			System.out.println(list_entries.get(i).getKey() + " : " + list_entries.get(i).getValue());
			if (i == 0) vo.setFirst(list_entries.get(i).getKey());
			if (i == 1) vo.setTwo(list_entries.get(i).getKey());
			if (i == 2) vo.setThree(list_entries.get(i).getKey());
			if (i == 3) vo.setFour(list_entries.get(i).getKey());
			if (i == 4) vo.setFive(list_entries.get(i).getKey());
		}
		System.out.println(vo.getFirst());
		System.out.println(vo.getFive());
		insertCrawl(vo);
		
	}

	@Override
	public void insertCrawl(CrawlDataVO vo) {
		map.insertCrawl(vo);
	}
    
	@Override
	public CrawlDataVO getCrawlList() {
		return map.getCrawlList();
	}
	
    
}
