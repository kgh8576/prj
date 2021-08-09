package com.one.style.admin.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.style.admin.service.AdminService;
import com.one.style.conhistory.service.ConhistoryService;
import com.one.style.conhistory.vo.ConHistoryVO;
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
	@RequestMapping(value = "/memberConHistoryUpdateForm.do", method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> memberConHistoryUpdateForm(Model model , HttpServletRequest req , HttpServletResponse resp) {
			ConHistoryVO vo = new ConHistoryVO();
			vo.setMemId(req.getParameter("memId"));
			System.out.println(vo.getMajor());

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
		    paging.setTotalCount(adminDao.memberConHistoryListTotalCountSelect(vo));
			
			List<ConHistoryVO> memberConHistoryList  = new ArrayList<ConHistoryVO>();
			memberConHistoryList = adminDao.memberConHistoryListSelect(vo);	
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberConHistoryList", memberConHistoryList);
			map.put("paging", paging);
			
			return map;
	}
	
	
	//아이디 파라미터로 다시 받을 것
	@RequestMapping("memberConsHistoryUpdate.do")
	public String memberConsHistoryUpdate(Model model , HttpServletRequest req , HttpServletResponse resp) {		
		
		MemberVO vo = new MemberVO();
		
		vo.setId(req.getParameter("id"));
		
		//model.addAttribute("member",adminDao.;
		return "admin/memberConsHistoryUpdateForm";
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
	

	@RequestMapping("designerConsHistoryUpdateForm.do")
	public String designerConsHistoryForm(Model model , HttpServletRequest req , HttpServletResponse resp) {
		
		return "admin/designerConsHistoryUpdateForm";
	}

	
	@RequestMapping("designerConsHistoryUpdate.do")
	public String designerConsHistoryUpdate(Model model , HttpServletRequest req , HttpServletResponse resp) {
		
		return "admin/designerConsHistoryUpdateForm";
	}
	
	//디자이너 회원 상태 업데이트
}
