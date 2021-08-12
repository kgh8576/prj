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
import com.one.style.files.vo.FilesVO;
import com.one.style.mem.vo.MemberVO;
import com.one.style.review.vo.ReviewVO;
import com.one.style.review.web.Paging;


@Controller
public class AdminController {
	@Autowired
	AdminService adminDao;	
	
//관리자 메인 페이지: 이동
	@RequestMapping("admin.do")
	public String admin(Model model , HttpServletRequest req , HttpServletResponse resp) {
		return "admin/admin";
	}

//일반회원 관리
	
	//일반회원 관리 페이지: 정보 생성 및 이동
	@RequestMapping("memberManagement.do")
	public String memberManagement(Model model , HttpServletRequest req , HttpServletResponse resp) {
		
		MemberVO vo = new MemberVO();
		
		String page = req.getParameter("page");
		int pageCnt = 0;
		if( page == null || page == "") {
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
	
	//일반회원 상담내역 수정 폼 모달: 정보 생성
	@RequestMapping(value = "/memberConHistoryUpdateForm.do", method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> memberConHistoryUpdateForm(Model model , HttpServletRequest req , HttpServletResponse resp) {
			ConHistoryVO vo = new ConHistoryVO();
			vo.setMemId(req.getParameter("memId"));

			String page = req.getParameter("page");
			int pageCnt = 0;
			if(page == null || page == "") {
				pageCnt = 1;
			} else {
				pageCnt = Integer.parseInt(page);
			}
			
			//5건씩 페이징 처리
			vo.setFirstCnt((pageCnt-1)*5+1);
			vo.setLastCnt(pageCnt*5);
			
		    Paging paging = new Paging();
		    paging.setPageNo(pageCnt);
		    paging.setPageSize(5);
		    paging.setTotalCount(adminDao.memberConHistoryListTotalCountSelect(vo));
			
			List<ConHistoryVO> memberConHistoryList  = new ArrayList<ConHistoryVO>();
			memberConHistoryList = adminDao.memberConHistoryListSelect(vo);	
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberConHistoryList", memberConHistoryList);
			map.put("paging", paging);
			
			return map;
	}
	
	
	//일반회원 상담내역 수정 폼 모달: 입력값에 따른 업데이트
	@RequestMapping(value = "/memberConHistoryUpdate.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> memberConsHistoryUpdate(Model model , HttpServletRequest req , HttpServletResponse resp) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int resultN = 0;
		ConHistoryVO vo = new ConHistoryVO();
		
		vo.setConNo(Integer.parseInt(req.getParameter("conNo")));
		vo.setMemAttend(req.getParameter("memAttend"));
		vo.setDesAttend(req.getParameter("desAttend"));
		
		resultN = adminDao.memberConHistoryUpdate(vo);
		System.out.println(resultN);
		
		if(resultN != 0) {
			map.put("message", "처리 완료되었습니다.");			
		} else {
			map.put("message", "처리 실패하였습니다.");
		}
		
		
		return map;
	}
//일반회원 관리 끝	

	
	
	

//디자이너 관리
	//디자이너 관리 페이지: 정보 생성 및 이동
	@RequestMapping("designerManagement.do")
	public String designerManagement(Model model , HttpServletRequest req , HttpServletResponse resp) {
		
		DesVO vo = new DesVO();
		
		String id = req.getParameter("id");
		vo.setId(id);
		
		String page = req.getParameter("page");
		
		int pageCnt = 0;
		if( page == null || page == "") {
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
	
	//디자이너 상담내역 수정 폼 모달: 정보 생성
	@RequestMapping(value = "/designerConHistoryUpdateForm.do", method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> designerConsHistoryUpdateForm(Model model , HttpServletRequest req , HttpServletResponse resp) {
		
		ConHistoryVO vo = new ConHistoryVO();
		vo.setDesId(req.getParameter("desId"));

		System.out.println(vo.getDesId());
		
		String page = req.getParameter("page");
		
		int pageCnt = 0;
		
		if( page == null || page == "") {
			pageCnt = 1;
		} else {
			pageCnt = Integer.parseInt(page);
		}
		
		System.out.println("pageCnt: " + pageCnt);
		
		//5건씩 페이징 처리
		vo.setFirstCnt((pageCnt-1)*5+1);
		vo.setLastCnt(pageCnt*5);
		
	    Paging paging = new Paging();
	    paging.setPageNo(pageCnt);
	    paging.setPageSize(5);
	    paging.setTotalCount(adminDao.designerConHistoryListTotalCountSelect(vo));
		
		List<ConHistoryVO> designerConHistoryList  = new ArrayList<ConHistoryVO>();
		designerConHistoryList = adminDao.designerConHistoryListSelect(vo);	
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("designerConHistoryList", designerConHistoryList);
		map.put("paging", paging);
		
		return map;
	}

	//디자이너 상담내역 수정 폼 모달: 입력값에 따른 업데이트
	@RequestMapping(value = "/designerConHistoryUpdate.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> designerConsHistoryUpdate(Model model , HttpServletRequest req , HttpServletResponse resp) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int resultN = 0;
		ConHistoryVO vo = new ConHistoryVO();
		
		vo.setConNo(Integer.parseInt(req.getParameter("conNo")));
		vo.setMemAttend(req.getParameter("memAttend"));
		vo.setDesAttend(req.getParameter("desAttend"));
		
		resultN = adminDao.designerConHistoryUpdate(vo);
		System.out.println(resultN);
		
		if(resultN != 0) {
			map.put("message", "처리 완료되었습니다.");			
		} else {
			map.put("message", "처리 실패하였습니다.");
		}
		
		
		return map;
	}
	
	//디자이너 상태 수정 폼 모달: 정보 생성
	@RequestMapping(value = "/designerStateUpdateForm.do", method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> designerStateUpdateForm(Model model , HttpServletRequest req , HttpServletResponse resp) {
		DesVO dvo = new DesVO();
		dvo.setId(req.getParameter("desId"));
		
		FilesVO fvo = new FilesVO();
		fvo.setDes_id(req.getParameter("desId"));

		DesVO designerStateOne  = new DesVO();
		List<FilesVO> designerCertificationFileList = new ArrayList<FilesVO>();
		designerStateOne = adminDao.designerStateOneSelect(dvo);
		designerCertificationFileList = adminDao.designerCertificationFileListSelect(fvo);	
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("designerStateOne", designerStateOne);
		map.put("designerCertificationFileList", designerCertificationFileList);
		
		
		return map;
	}
	
	
	//디자이너 상태 수정 폼 모달: 입력값에 따른 업데이트
	@RequestMapping(value = "/designerStateUpdate.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> designerStateUpdate(Model model , HttpServletRequest req , HttpServletResponse resp) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		DesVO vo = new DesVO();
		int resultN = 0;
		
		vo.setId(req.getParameter("id"));
		vo.setState(req.getParameter("state"));
		vo.setComments(req.getParameter("comments"));
		
		resultN = adminDao.designerStateUpdate(vo);
		
		if(resultN != 0) {
			map.put("message", "처리 완료되었습니다.");			
		} else {
			map.put("message", "처리 실패하였습니다.");
		}
		
		
		return map;
	}
//디자이너 관리 끝
	
}
