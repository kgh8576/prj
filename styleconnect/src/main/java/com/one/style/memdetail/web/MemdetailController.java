package com.one.style.memdetail.web;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.mem.service.MemService;
import com.one.style.mem.vo.MemberVO;
import com.one.style.memdetail.service.MemdetailService;


@Controller
public class MemdetailController {

	@Autowired
	MemService memDao;
	
	@Autowired
	MemdetailService memdetailDao;
	
	//마이페이지 이동
	@RequestMapping("/membermypage.do")
	public String membermypage(Model model ,HttpServletRequest request,MemberVO vo,ConHistoryVO cvo) {
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		cvo.setMemId(id);
		model.addAttribute("user",memDao.login(vo));
		model.addAttribute("conhis",memdetailDao.conhisList(cvo));
		model.addAttribute("conhisends",memdetailDao.conhisListend(cvo));
		System.out.println(memdetailDao.conhisList(cvo));
		System.out.println(memdetailDao.conhisListend(cvo));
		return "mymenu/mymenu";
	}
	//상담내역 리스트
		@RequestMapping("/conhispage.do")
		public String conhispage(Model model ,HttpServletRequest request,MemberVO vo,ConHistoryVO cvo) {
			HttpSession session = request.getSession();
			
			String id = (String) session.getAttribute("id");
			cvo.setMemId(id);
			model.addAttribute("conhis",memdetailDao.conhisList(cvo));
			return "mymenu/conhispage";
		}
		//노쇼
				@RequestMapping("/noshow.do")
				public String noshow(Model model ,HttpServletRequest request,MemberVO vo,ConHistoryVO cvo) {
					HttpSession session = request.getSession();
					
					String id = (String) session.getAttribute("id");
					cvo.setMemId(id);
					model.addAttribute("conhisends",memdetailDao.conhisListend(cvo));
					return "mymenu/noshow";
				}
	//핸드폰번호 변경
	@RequestMapping("/hpchange.do")
	public String hpchange(HttpServletRequest request , MemberVO vo) {
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		
		memdetailDao.hpchange(vo);
		
		return "redirect:membermypage.do";
	}
	//비밀번호변경 페이지 이동
	@RequestMapping("/pwchangepage.do")
	public String pwchangepage() {
		return "mymenu/pwchangepage";
	}
	//비밀번호변경
	@RequestMapping("/pwchange.do")
	@ResponseBody
	public int pwchange(HttpServletRequest request,MemberVO vo) {
		//세션에있는 아이디를 가지고온다
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		// 비밀번호 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4);
		String pw = request.getParameter("gupw");
		String newpassword = request.getParameter("pw");
		//암호화시킨 기존비밀번호
		//String encoderPW = encoder.encode(pw);
		//암호화시킨 새로운비밀번호
		String NEWencoderPW = encoder.encode(newpassword);
		// 결과값리턴을 위해서 cnt 선언
		int cnt = 0;
		// DB에 있는 password값 가지고오기
		MemberVO mvo = memDao.login(vo);
		//입력들어온 pw값과 DB에 있는 password 값을 비교 맞으면 true / 틀리면 false
		boolean b = encoder.matches(pw, mvo.getPw());
		// 비교한 패스워드가 같을경우
		if(b) {
			//vo에 암호화된 새로운 PW 를 넣고
			vo.setPw(NEWencoderPW);
			//비밀번호 업데이트시킴
			memdetailDao.pwchange(vo);
			cnt = 1;
		}
	
		return cnt;
	}
	//회원탈퇴페이지이동
	@RequestMapping("/exitpage.do")
	public String exitpage () {
		return "mymenu/memexit";
	}
	//회원탈퇴
	@RequestMapping("/memexit.do")
	@ResponseBody
	public int memexit (MemberVO vo, HttpServletRequest request) {
		//세션에있는 ID값호출
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		//아이디값 vo객체에 담아줌
		vo.setId(id);
		//암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4);
		//ID와 PASSWORD MVO에 담아줌
		MemberVO mvo = memDao.login(vo);
		//VO(입력받은 비밀번호값)과 MVO(DB에 저장된 비밀번호값)매칭확인
		boolean b = encoder.matches(vo.getPw(), mvo.getPw());
		int YorN = 0;
		//매칭해서 TRUE가 나온다면
		if(b) {
			//회원정보삭제 실행
			memdetailDao.memexit(mvo);
			YorN = 1;
			//세션끊기
			session.invalidate();
			
		}
		//1OR2를 리턴해줌
		System.out.println(YorN);
		return YorN;
	}
	
	//예약날짜계산
	@RequestMapping("/paycancle.do")
	@ResponseBody
	public String paycancle (ConHistoryVO vo) {
		
		
		return memdetailDao.getCancleDate(vo);
	}
	//예약취소
	@RequestMapping("/reservationcancle.do")
	public void reservationcancle (ConHistoryVO vo) {
		
		memdetailDao.reservationcancle(vo);
	}
}
