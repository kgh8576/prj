package com.one.style.home.web;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.one.style.home.service.HomeService;
import com.one.style.mem.service.MemService;

@Controller
public class HomeController {
	
	@Autowired
	MemService memberDao;
	@Autowired
	HomeService homeDao;

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		model.addAttribute("memDetail", homeDao.memDetail(id));
		model.addAttribute("rcmdDesByConHis", homeDao.rcmdDesByConHis(id));
		model.addAttribute("rcmdDesByRate", homeDao.rcmdDesByRate(id));
		
		
		return "main/home";
	}

	
}
