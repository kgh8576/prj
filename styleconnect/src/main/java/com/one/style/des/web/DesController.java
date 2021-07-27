package com.one.style.des.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.style.des.service.DesService;
import com.one.style.des.vo.DesVO;

@Controller
public class DesController {

	@Autowired
	DesService desDao;
	
	//디자이너 로그인
	@RequestMapping("/desloginCheck.do")
	public String desloginCheck(HttpServletRequest request, HttpServletResponse response, DesVO vo) {
		HttpSession session = request.getSession();
		DesVO dvo = new DesVO();
		dvo = desDao.login(vo);
		
		
		return null;
	}
	
}
