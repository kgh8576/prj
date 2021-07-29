package com.one.style.conhistory.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.style.conhistory.service.ConhistoryService;
import com.one.style.conhistory.vo.ConHistorVO;
import com.one.style.wokrOpen.service.WorkOpenService;

@Controller
public class ConHistoryController {
	
	
	@Autowired
	ConhistoryService conHistoryDao;
	
	@RequestMapping("reservation.do")
	public String reservation(Model model , HttpServletRequest req , HttpServletResponse resp) {
		String courNo =  req.getParameter("courNo");
		
		HttpSession session = req.getSession();
		session.setAttribute("courNo", courNo);
		return "reservation/reservation";
	}
	
	@RequestMapping("consulting.do")
	public String consulting(Model model , HttpServletRequest req , HttpServletResponse resp) {
		ConHistorVO vo = new ConHistorVO();
		HttpSession session = req.getSession();
		
		vo.setMemId((String)session.getAttribute("id"));  
		model.addAttribute("conHistoryList", conHistoryDao.conhistoryList(vo));
		
		return "consulting/consulting";
	}

	
}
