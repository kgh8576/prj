package com.one.style.admin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.style.admin.service.AdminService;
import com.one.style.conhistory.service.ConhistoryService;


@Controller
public class AdminController {
	@Autowired
	AdminService adminDao;	
	
	@RequestMapping("admin.do")
	public String admin(Model model , HttpServletRequest req , HttpServletResponse resp) {
		
		return "admin/admin";
	}
		
	@RequestMapping("memberManagement.do")
	public String memberManagement(Model model , HttpServletRequest req , HttpServletResponse resp) {
		
		model.addAttribute("memberList",adminDao.memberListSelect());
		
		return "admin/memberManagement";
	}
	
	@RequestMapping("designerManagement.do")
	public String designerManagement(Model model , HttpServletRequest req , HttpServletResponse resp) {
		
		return "admin/designerManagement";
	}
}
