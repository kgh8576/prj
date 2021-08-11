package com.one.style.home.web;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.one.style.crawldata.service.CrawlDataService;
import com.one.style.home.service.HomeService;
import com.one.style.mem.service.MemService;
import com.one.style.mem.vo.MemDetailVO;

@Controller
public class HomeController {
	
	@Autowired
	MemService memberDao;
	@Autowired
	HomeService homeDao;
	@Autowired
	CrawlDataService crawlDao;
	
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest req) {
		
		// 로그인되어 있는 경우 추천 디자이너 뿌리기
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		if (id != null) {
			MemDetailVO memDetail = homeDao.memDetail(id);
			model.addAttribute("memDetail", memDetail);
			if (memDetail != null) {
				model.addAttribute("rcmdDesByConHis", homeDao.rcmdDesByConHis(memDetail));
				model.addAttribute("rcmdDesByRate", homeDao.rcmdDesByRate(memDetail));
			}
		}
		model.addAttribute("hashTag", crawlDao.getCrawlList("MALE"));
		return "main/home";
	}
	
	
}
