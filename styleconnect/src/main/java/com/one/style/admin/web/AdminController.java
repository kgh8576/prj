package com.one.style.admin.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
	

	@RequestMapping(value = "/designerConHistoryUpdateForm.do", method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> designerConsHistoryUpdateForm(Model model , HttpServletRequest req , HttpServletResponse resp) {
		
		ConHistoryVO vo = new ConHistoryVO();
		vo.setDesId(req.getParameter("desId"));

		System.out.println(vo.getDesId());
		
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
	    paging.setTotalCount(adminDao.designerConHistoryListTotalCountSelect(vo));
		
		List<ConHistoryVO> designerConHistoryList  = new ArrayList<ConHistoryVO>();
		designerConHistoryList = adminDao.designerConHistoryListSelect(vo);	
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("designerConHistoryList", designerConHistoryList);
		map.put("paging", paging);
		
		return map;
	}

	//디자이너 회원 상태 업데이트
	@RequestMapping(value = "/designerConHistoryUpdate.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> designerConsHistoryUpdate(Model model , HttpServletRequest req , HttpServletResponse resp) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int resultN = 0;
		ConHistoryVO vo = new ConHistoryVO();
		
		vo.setConNo(Integer.parseInt(req.getParameter("conNo")));
		vo.setMemAttend(req.getParameter("memAttend"));
		vo.setDesAttend(req.getParameter("desAttend"));
		
		resultN = adminDao.designerConHistoryListUpdate(vo);
		System.out.println(resultN);
		
		if(resultN != 0) {
			map.put("message", "처리 완료되었습니다.");			
		} else {
			map.put("message", "처리 실패하였습니다.");
		}
		
		
		return map;
	}
	

	
	
}
