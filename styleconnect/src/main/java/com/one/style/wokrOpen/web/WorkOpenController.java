package com.one.style.wokrOpen.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.style.wokrOpen.service.WorkOpenService;
import com.one.style.wokrOpen.vo.WorkOpenVO;

@Controller
public class WorkOpenController {

	
	@Autowired
	WorkOpenService workOpenDao;
	
	
	@RequestMapping("workTime.do")
	@ResponseBody
	public String[] workTime(WorkOpenVO vo , Model model) {
		return workOpenDao.getRealWorkOpenTime(vo);
	}
	
	
	
}
