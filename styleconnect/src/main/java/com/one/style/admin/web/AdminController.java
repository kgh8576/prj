package com.one.style.admin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.style.admin.service.AdminService;
import com.one.style.conhistory.service.ConhistoryService;
import com.one.style.des.vo.DesVO;
import com.one.style.mem.vo.MemberVO;
import com.one.style.review.vo.ReviewVO;
import com.one.style.review.web.Paging;


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
		
		MemberVO vo = new MemberVO();
		
		String page = req.getParameter("page");
		int pageCnt = 0;
		if( page == null) {
			pageCnt = 1;
		} else {
			pageCnt = Integer.parseInt(page);
		}
		
		//10건씩 페이징 처리
		vo.setFirstCnt((pageCnt-1)*10+1);
		vo.setLastCnt(pageCnt*10);
	    Paging paging = new Paging();
	    paging.setPageNo(pageCnt);
	    paging.setPageSize(10);
	    paging.setTotalCount(adminDao.memberListTotalCountSelect());
		
	    model.addAttribute("memberList",adminDao.memberListSelect(vo));
		model.addAttribute("paging",paging);
		
		
		return "admin/memberManagement";
	}
	
	@RequestMapping("designerManagement.do")
	public String designerManagement(Model model , HttpServletRequest req , HttpServletResponse resp) {
		
		DesVO vo = new DesVO();
		
		String page = req.getParameter("page");
		int pageCnt = 0;
		if( page == null) {
			pageCnt = 1;
		} else {
			pageCnt = Integer.parseInt(page);
		}
		
		//10건씩 페이징 처리
		vo.setFirstCnt((pageCnt-1)*10+1);
		vo.setLastCnt(pageCnt*10);
	    Paging paging = new Paging();
	    paging.setPageNo(pageCnt);
	    paging.setPageSize(10);
	    paging.setTotalCount(adminDao.designerListTotalCountSelect());
		
	    model.addAttribute("designerList",adminDao.designerListSelect(vo));
		model.addAttribute("paging",paging);
		
		return "admin/designerManagement";
	}
}
