package com.one.style.conhistory.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ConHistoryController {

	
	@RequestMapping("reservation.do")
	public String reservation(Model model , HttpServletRequest req , HttpServletResponse resp) {
		HttpSession session = req.getSession();
		session.setAttribute("courNo", "5");
		return "reservation/reservation";
	}
	

	
}
