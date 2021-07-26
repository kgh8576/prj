package com.one.style.dessearch.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.style.dessearch.service.DessearchService;

@Controller    
public class DessearchController {

	@Autowired
	private DessearchService dao;
	
	@RequestMapping("category.do")
	public String categoryList(Model model) {
		model.addAttribute("designer",dao.selectDessearchList());
	return("dessearch/desCategoryList");
	}
	
	@RequestMapping("cutList.do")
	public String cutList(Model model) {
		model.addAttribute("cut",dao.cutList());
	return("dessearch/desList");
	}
	@RequestMapping("permList.do")
	public String permList(Model model) {
		model.addAttribute("perm",dao.permList());
	return("dessearch/desList");
	}
}
     