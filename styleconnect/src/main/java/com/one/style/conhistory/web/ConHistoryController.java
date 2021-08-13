package com.one.style.conhistory.web;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.style.conhistory.service.ConhistoryService;
import com.one.style.conhistory.vo.ConHistoryVO;

@Controller
public class ConHistoryController {
	
	@Autowired
	ConhistoryService conHistoryDao;
	
	@RequestMapping("reservation.do")
	public String reservation(Model model , HttpServletRequest req , HttpServletResponse resp , ConHistoryVO vo)  {
		model.addAttribute("course", conHistoryDao.desCourseDetail(vo));
		model.addAttribute("desImg",conHistoryDao.reservationDesImg(vo));
		return "reservation/reservation";
	}
	
	//상담하기 페이지: 상담 내역 리스트 반환
	@RequestMapping("consulting.do")
	public String consulting(Model model , HttpServletRequest req , HttpServletResponse resp) {
		HttpSession session = req.getSession();
		ConHistoryVO vo = new ConHistoryVO();
		
		//일반회원인 경우
		if(session.getAttribute("id") != null) {
			vo.setMemId((String)session.getAttribute("id")); 
		//디자이너인 경우
		} else if (session.getAttribute("did") != null) {
			vo.setDesId((String)session.getAttribute("did")); 
		}
		
		model.addAttribute("conHistoryList", conHistoryDao.conHistoryListSelect(vo));
		
		return "consulting/consulting";
	}
	
	@RequestMapping("conHistoryInsert.do")
	public String conHistoryInsert(ConHistoryVO vo) {
		conHistoryDao.conHistoryInsert(vo);
		return "redirect:membermypage.do";
	}
	
	//상담하기 페이지: 상담 참여 시 DB의 consulting_history 테이블의 mem_attend 또는 des_attend 값을 N에서 Y로 변경
	@RequestMapping(value = "conHistoryAttendUpdate.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, String> conHistoryAttendUpdate(HttpServletRequest req, int conNo) {
		HttpSession session = req.getSession();
		ConHistoryVO vo = new ConHistoryVO();
		
		vo.setConNo(conNo);
		
		//일반회원인 경우
		if(session.getAttribute("id") != null) {
			vo.setMemId((String)session.getAttribute("id")); 	 
		//디자이너인 경우
		} else if (session.getAttribute("did") != null) {
			vo.setDesId((String)session.getAttribute("did"));
		}
		
		conHistoryDao.conHistoryAttendUpdate(vo);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("reply", "응답");
		
		return map;
	}
	
	@RequestMapping("memResrTimeCheck.do")
	@ResponseBody
	public int memResrTimeCheck(ConHistoryVO vo) {
		return conHistoryDao.memResrTimeCheck(vo).size();
	}
	

	
}
