package com.one.style.conhistory.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ConHistoryController {

	
	@RequestMapping("reservation.do")
	public String reservation(Model model ) {
		
		return "reservation/reservation";
	}
	

	
}
