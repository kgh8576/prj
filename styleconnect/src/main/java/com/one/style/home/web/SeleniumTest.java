package com.one.style.home.web;

import java.time.Duration;
import java.util.concurrent.TimeUnit;

import org.openqa.jetty.html.Element;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.WebDriverWait;
 
public class SeleniumTest {
 
//    public static void main(String[] args) {
//        SeleniumTest selTest = new SeleniumTest();
//        selTest.crawl();
//        
//    }
// 
//    //WebDriver
//    private WebDriver driver;
//    
//    //Properties
//    public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
//    public static final String WEB_DRIVER_PATH = "C:/chromedriver.exe";
//    
//    //크롤링 할 URL
//    private String base_url;
//    
//    public SeleniumTest() {
//        super();
//        //System Property SetUp
//        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
//        //Driver SetUp
//        ChromeOptions options = new ChromeOptions();
//        //options.addArguments("headless");
//        
//        driver = new ChromeDriver(options);
//        base_url = "https://www.instagram.com/";
//    }
// 
//    public void crawl() {
//        try {
//        	
//        	driver.get(base_url);
//        	Thread.sleep(3000);
//        	driver.findElement(By.cssSelector("#loginForm > div > div:nth-child(1) > div > label > input")).sendKeys("internet2dot0"); 
//        	driver.findElement(By.cssSelector("#loginForm > div > div:nth-child(2) > div > label > input")).sendKeys("crawlcrawl"); 
//        	driver.findElement(By.cssSelector("#loginForm > div > div:nth-child(3) > button")).click();
//        	Thread.sleep(6000);
//        	Thread.sleep(50000000);
//        	/*
//        	driver.get("www.instagram.com/");
//        	driver.findElement(By.className("sqdOP yWX7d    y3zKF     ")).click();
//        	driver.manage().timeouts().implicitlyWait(1, TimeUnit.SECONDS);
//        	driver.findElement(By.cssSelector("#loginForm > div > div:nth-child(1) > div > label > input")).sendKeys("internet2dot0"); 
//        	driver.findElement(By.cssSelector("#loginForm > div > div:nth-child(2) > div > label > input")).sendKeys("crawlcrawl"); 
//        	driver.findElement(By.cssSelector("#loginForm > div > div:nth-child(3) > button")).click();
//        	driver.manage().timeouts().implicitlyWait(3, TimeUnit.SECONDS);
//        	driver.findElement(By.className("sqdOP yWX7d    y3zKF     ")).click();
//        	driver.findElement(By.className("sqdOP yWX7d    y3zKF     ")).click();
//        	
//        	driver.get("");
//        	
//        	*/
//        	
//        	/*
//        	
//            driver.get(base_url);
//            driver.manage().timeouts().implicitlyWait(1, TimeUnit.SECONDS);
//            WebElement element = driver.findElement(By.cssSelector("body"));
//            // WebElement element = driver.findElement(By.cssSelector("body > div#react-root"));
//            // WebElement element = driver.findElement(By.xpath("//body/div[2]"));
//            // WebElement element = driver.findElement(By.xpath("//body/div[3]/div[1]/div[0]/article/div[2]/div/ul/li/div/div/div[1]/span"));
//            System.out.println(element.getText());
//            */
//            driver.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
}
