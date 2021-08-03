package com.one.style.home.web;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.one.style.mem.service.MemService;

@Controller
public class HomeController {
	
	@Autowired
	MemService memberDao;


	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main/home";
	}

	
}
