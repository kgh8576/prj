package com.one.style.mem.web;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.style.mem.service.MemService;
import com.one.style.mem.vo.MemberVO;

import edu.emory.mathcs.backport.java.util.Collections;

@Controller
public class MemController {

	@Autowired
	MemService memberDao;

	// 로그인페이지이동
	@RequestMapping("/loginpage.do")
	public String loginpage(Model model) {
		return "member/login";
	}
	
	
	// 맴버 로그인체크
	@RequestMapping("/loginCheck.do")
	@ResponseBody
	public Map logincheck(HttpServletRequest request,HttpServletResponse response, MemberVO vo) throws IOException {
		HttpSession session = request.getSession();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
		int cnt = 0;
		//1.id로 단건조회
		MemberVO mvo = memberDao.login(vo);
		
		//2.vo == null id가 없음 리턴
		if(mvo != null)  {
			// id가 있으면 패스워드 (match)비교
			boolean b = encoder.matches(vo.getPw(), mvo.getPw());
			// 패스워드 같을 경우
			if (b) {
				cnt = 1;
				session.setAttribute("id", mvo.getId());
				session.setAttribute("user",mvo);				
			} 
			// 패스워드 다를 경우
			
		}		
		return Collections.singletonMap("result", cnt);
	}
	
	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:main.do";
	}
	
	@RequestMapping("/memberinsertpage.do")
	public String insertpagemove() {
		return "member/memberInsert";
	}
	
	@RequestMapping("/userIdCheck.do")
	public String  userIdCheck(HttpServletRequest request,HttpServletResponse response, MemberVO vo) throws IOException {
	
		String id = request.getParameter("id");
		vo.setId(id);
		MemberVO mvo = new MemberVO();
		
		System.out.println("컨트롤럴 id값" + id);
		boolean b = memberDao.insertcheck(vo);
		int cnt = 1;
		
		if(b) {
			cnt = 1;
			response.getWriter().print(cnt);
		} else {
			cnt = 0;
			response.getWriter().print(cnt);
		}
		return null;
	}
	//회원가입
	@RequestMapping("/memberInsert.do")
	public String memberInsert(MemberVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession();

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
		String encoderPW = encoder.encode(vo.getPw());
		vo.setPw(encoderPW);
		
		memberDao.memberInsert(vo);
		session.setAttribute("id", vo.getId());
		
		return "redirect:main.do";
	}
	//회원가입 페이지이동
	@RequestMapping("/Insertchoice.do")
	public String insertchoice() {
		return "member/insertchoicepage";
	}
}
