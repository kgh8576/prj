package com.one.style.des.web;

import java.io.IOException;

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
	public String desloginCheck(HttpServletRequest request, HttpServletResponse response, DesVO vo) throws IOException {
		HttpSession session = request.getSession();
		DesVO dvo = new DesVO();
		dvo = desDao.login(vo);
		boolean b = desDao.loginCheck(vo);
		int cnt = 1;
		if(b) {
			cnt = 1;
			session.setAttribute("id", dvo.getId());
			session.setAttribute("user", dvo);
			response.getWriter().print(cnt);
		}else {
			cnt = 0;
			response.getWriter().print(cnt);
		}
		
		
		return null;
	}
	
	//디자이너 회우너가입페이지 이동
	@RequestMapping("/desinsertpage.do")
	public String desInsert() {
		return "designer/designerinsert";
	}
	
}
