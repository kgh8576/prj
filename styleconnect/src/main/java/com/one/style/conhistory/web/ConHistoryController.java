package com.one.style.conhistory.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.velocity.runtime.directive.Foreach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.style.conhistory.service.ConhistoryService;
import com.one.style.conhistory.vo.ConHistoryVO;

@Controller
public class ConHistoryController {
	
	
	@Autowired
	ConhistoryService conHistoryDao;
	
	@RequestMapping("reservation.do")
	public String reservation(Model model , HttpServletRequest req , HttpServletResponse resp) {
		String courNo =  req.getParameter("courNo");
		ConHistoryVO vo = new ConHistoryVO();
		vo.setCourNo(Integer.parseInt(courNo));
		model.addAttribute("course", conHistoryDao.desCourseDetail(vo));
		return "reservation/reservation";
	}
	
	@RequestMapping("consulting.do")
	public String consulting(Model model , HttpServletRequest req , HttpServletResponse resp) {
		ConHistoryVO vo = new ConHistoryVO();
		HttpSession session = req.getSession();

		//일반회원으로 로그인한 경우
		if(session.getAttribute("id") != null) {
			vo.setMemId((String)session.getAttribute("id")); 
		//디자이너으로 로그인한 경우
		} else if (session.getAttribute("did") != null) {
			vo.setDesId((String)session.getAttribute("did")); 
		}
		System.out.println("세션값 테스트) 디자이너 아이디: " + (String)session.getAttribute("did"));
		
		System.out.println("vo값 테스트) 일반회원 아이디: " +  vo.getMemId());
		System.out.println("vo값 테스트) 디자이너 아이디: " +  vo.getDesId());
		 
		
		model.addAttribute("conHistoryList", conHistoryDao.conhistoryList(vo));
		

		
		return "consulting/consulting";
	}
	
	@RequestMapping("conHistoryInsert.do")
	public String conHistoryInsert(ConHistoryVO vo) {
		conHistoryDao.conHistoryInsert(vo);
		return "redirect:main.do";//나중에 마이페이지 가야됨 ㅋㅋ
	}

	
}
