package com.one.style.dessearch.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.style.dessearch.service.DessearchService;
import com.one.style.dessearch.vo.DessearchVO;

@Controller    
public class DessearchController {
	@Autowired
	private DessearchService dao;
	
	//디자이너 카테고리
	@RequestMapping("category.do")
	public String categoryList(Model model) {
		model.addAttribute("designer",dao.dessearchSelectList());
	return("dessearch/desCategoryList");
	}
	//전체디자이너 목록
	@RequestMapping("cutList.do")
	public String cutList(Model model) {
		model.addAttribute("designer",dao.cutList());
	return("dessearch/desList");
	}
	//디자이너상세페이지
	@RequestMapping("desListSelect.do")
	public String desListSelect(Model model, @RequestParam("id")String id) {
		model.addAttribute("designer",dao.dessearchSelect(id));
		
	return("dessearch/desListSelect");
	}
	//펌전문디자이너 목록
	@RequestMapping("permList.do")
	public String permList(Model model) {
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
     