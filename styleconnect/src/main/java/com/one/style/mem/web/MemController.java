package com.one.style.mem.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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

import com.one.style.conhistory.vo.ConHistoryVO;
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
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4);
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
		
		int b = memberDao.insertcheck(vo);
		int cnt = 1;
		
		if(b == 1) {
			cnt = 0;
			response.getWriter().print(cnt);
		} else {
			cnt = 1;
			response.getWriter().print(cnt);
		}
		return null;
	}
	//회원가입
	@RequestMapping("/memberInsert.do")
	public String memberInsert(MemberVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession();

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4);
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
	//로그인시 스케줄확인
	@RequestMapping("/checkSchedule.do")
	@ResponseBody
	public int checkSchedule (ConHistoryVO vo) {
		int count = 0;
		boolean a = memberDao.checkSchedule(vo);
		if(a) {
			count = 1;
		}
		return  count;
	}
	@RequestMapping("/startSchedule.do")
	@ResponseBody
	public int startSchedule (ConHistoryVO vo) {
		int count = 0;
		boolean a = memberDao.startSchedule(vo);
		if(a) {
			count = 1;
		}
		return  count;
	}
	
	
	//ID/PW 찾기 페이지이동
	@RequestMapping("/recoverIdPwPage.do")
	public String forgotIdPWPage() {
		return "member/recoverIdPwPage";
	}
	
	//통합 ID 찾기
	@RequestMapping("getUserIdByHpName.do")
	@ResponseBody
	public List<MemberVO> getUserIdByHpName(String hp, String name, String searchTable) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("hp", hp); // 전화번호 정규식 적용하여 넣는 게 필요한지 ?
		map.put("name", name);
		map.put("searchTable", searchTable); // 디자이너와 멤버 테이블 어느걸 조회할지 분기하는 파라미터
		
		List<MemberVO> list = memberDao.getUserIdByHpName(map); // 핸드폰 번호와 이름으로 아이디 리턴
		
		if (list.size() != 0) {
			return list;	
		} else {
			return null; 
		}
	}
	//통합 비밀번호 변경
	@RequestMapping("updateUserPwById.do")
	@ResponseBody
	public String updateUserPwByHpName(String id, String searchTable, String pw) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4); // 비밀번호 암호화
		String encoderPW = encoder.encode(pw);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", encoderPW);
		map.put("searchTable", searchTable); // 디자이너와 멤버 테이블 어디에 update 할지 분기하는 파라미터
		int r = memberDao.updateUserPwByHpName(map);
		return r + "건 업데이트";
	}
	//통합 ID 존재 체크 ( 없는 번호로 sms인증 날리면 돈아까움 )
	@RequestMapping("checkExistUserByIdHp.do")
	@ResponseBody
	public boolean checkExistUserByIdHp(String hp, String name, String searchTable) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchTable", searchTable);
		map.put("hp", hp);
		map.put("name", name);
		return memberDao.checkExistUserByIdHp(map);
	}
}
