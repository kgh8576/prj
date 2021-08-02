package com.one.style.home.web;

import java.time.Duration;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.openqa.jetty.html.Element;
import org.openqa.jetty.html.Script;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.remote.server.handler.FindElement;
import org.openqa.selenium.support.ui.WebDriverWait;

import net.bytebuddy.asm.Advice.AllArguments;
 
public class SeleniumTest {

    //WebDriver
    private WebDriver driver;
    //Properties
    public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static final String WEB_DRIVER_PATH = "C:/chromedriver.exe";
    //크롤링 할 URL
    private String base_url;
    private String[] urls;
    private String[] hashtags;
	
    public static void main(String[] args) {
        SeleniumTest selTest = new SeleniumTest();
        selTest.initCrawl();
        selTest.runCrawl();
        
    }
 
    public SeleniumTest() {
        super();
        //System Property SetUp
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
        //Driver SetUp
        ChromeOptions chromeOptions = new ChromeOptions();
        chromeOptions.addArguments("--disable-gpu","-no-sandbox");
        chromeOptions.addArguments("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36");
        chromeOptions.addArguments("lang=ko_KR");
        driver = new ChromeDriver(chromeOptions);
        base_url = "https://www.instagram.com/accounts/login/";
    }
    
    public void initCrawl() {
        try {
        	driver.manage().window().maximize();
        	driver.get(base_url);
        	Thread.sleep(3000);
        	driver.findElement(By.cssSelector("#loginForm > div > div:nth-child(1) > div > label > input")).sendKeys("internet2dot0"); 
        	driver.findElement(By.cssSelector("#loginForm > div > div:nth-child(2) > div > label > input")).sendKeys("crawlcrawl"); 
        	driver.findElement(By.cssSelector("#loginForm > div > div:nth-child(3) > button")).click();
        	Thread.sleep(6000);
        	driver.findElement(By.cssSelector("#react-root > section > main > div > div > div > section > div > button")).click();
        	Thread.sleep(6000);
        	driver.findElement(By.xpath("/html/body/div[5]/div/div/div/div[3]/button[2]")).click();
        	driver.get("https://www.instagram.com/explore/tags/%EB%82%A8%EC%9E%90%EB%A8%B8%EB%A6%AC/");
        	Thread.sleep(6000);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void runCrawl() {
    	try {
        	System.out.println("------------------");
        	WebElement mainDiv = driver.findElement(By.xpath("/html/body/div[1]/section/main/article/div[2]/div"));
        	List<WebElement> div3List = mainDiv.findElements(By.tagName("div"));
        	for (WebElement div3 : div3List) {
        		List<WebElement> divList = div3.findElements(By.tagName("div"));
        		for (WebElement div : divList) {
					div.click();
					Thread.sleep(3000);
					driver.findElement(By.xpath("/html/body/div[5]/div[3]/button")).sendKeys(Keys.ENTER);;
					Thread.sleep(3000);
				}
				
			}
        	//System.out.println(str);
        	Thread.sleep(60000000);
            driver.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
}
