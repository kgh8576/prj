package com.one.style.memdetail.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.style.mem.service.MemService;
import com.one.style.mem.vo.MemberVO;


@Controller
public class MemdetailController {

	@Autowired
	MemService memDao;
	//마이페이지 이동
	@RequestMapping("/membermypage.do")
	public String membermypage(Model model ,HttpServletRequest request,MemberVO vo) {
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		model.addAttribute("user",memDao.login(vo));
		
		return "mymenu/mymenu";
	}
}
