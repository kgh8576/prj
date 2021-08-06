package com.one.style.dessearch.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.style.dessearch.service.DessearchService;
import com.one.style.dessearch.vo.DessearchVO;
import com.one.style.review.web.Paging;

@Controller    
public class DessearchController {
	@Autowired
	private DessearchService dao;
	
	//디자이너 카테고리
	@RequestMapping("category.do")
	public String categoryList(Model model) {
	return("dessearch/desCategoryList");
	}
	
	//상담 목록
	@RequestMapping("courseList.do")
	public String courseList(Model model,DessearchVO vo) {
		model.addAttribute("course",dao.courseList(vo));
		return ("dessearch/desCourseList");
	}
	//디자이너상세페이지
	@RequestMapping("desListSelect.do")
	public String desListSelect(Model model,DessearchVO vo, HttpServletRequest request) {
		model.addAttribute("designer",dao.dessearchSelect(vo));
		model.addAttribute("review",dao.dessearchSelectReview(vo));
		
		model.addAttribute("img",dao.desProImg(vo));
	return("dessearch/desListSelect");
	}
	
	//검색결과
	@RequestMapping("searchList.do")
	public String searchList(Model model, DessearchVO vo, HttpServletRequest request) {
		System.out.println("=====서치 키워드: "+vo.getSearch());
		
		HttpSession session = request.getSession();
		model.addAttribute("search",dao.searchList(vo));
		session.setAttribute("searchkeyword", vo.getSearch());
	return("dessearch/searchResult");
	}
	
	
	//컷 디자이너 목록
	@RequestMapping("cutList.do")
	public String cutList(Model model, DessearchVO vo) {		
	model.addAttribute("designer",dao.cutList());
	
	return("dessearch/desList");
	}
	
	//펌전문디자이너 목록
	@RequestMapping("permList.do")
	public String permList(Model model, DessearchVO vo, HttpServletRequest request) {
		String page = request.getParameter("page");
		if(page == null) page = "1";
		int getNum = Integer.parseInt(page);
		vo.setFirstCnt(1+(getNum -1)* 10);
		vo.setLastCnt(getNum * 10);
		vo.setTotalCnt(dao.permCnt());
		
		Paging paging = new Paging();
		paging.setPageNo(getNum);
		paging.setPageSize(6);
		paging.setTotalCount(vo.getTotalCnt());
		
		model.addAttribute("paging",paging);
		
		model.addAttribute("designer",dao.permList());
	return("dessearch/desList");
	}
	//염색전문디자이너 목록
	@RequestMapping("dyeList.do")
	public String dyeList(Model model) {
		model.addAttribute("designer",dao.dyeList());
	return("dessearch/desList");
	}
	//메이크업전문디자이너 목록
	@RequestMapping("makeupList.do")
	public String makeupList(Model model) {
		model.addAttribute("designer",dao.makeupList());
	return("dessearch/desList");
	}
	
}
     