package com.one.style.wokrOpen.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.one.style.files.mapper.FilesMapper;
import com.one.style.files.service.FilesService;
import com.one.style.files.vo.FilesVO;
import com.one.style.wokrOpen.service.WorkOpenService;
import com.one.style.wokrOpen.vo.WorkOpenVO;

@Controller
public class WorkOpenController {
	
	@Autowired
	WorkOpenService workOpenDao;
	
	@Autowired
	FilesService fileservice;
	
	@Autowired
	FilesMapper fileMap;

	@RequestMapping("workTime.do")
	@ResponseBody
	public String[] workTime(WorkOpenVO vo, Model model) {
		return workOpenDao.getRealWorkOpenTime(vo);
	}

	@RequestMapping("fileUploadTest.do")
	public String uploadView(Model model) {
		fileservice.dateTest();
		model.addAttribute("date", workOpenDao.dateTest()); 
		FilesVO vo = new FilesVO();
		vo.setDes_id("des05");
		return "test/FileTest";
	}

	@RequestMapping("/uploadTest.do")
	public String uploadTest(MultipartHttpServletRequest req) {
		fileservice.upload(req,"cer","des05");
		return "redirect:fileUploadTest.do";
	}

}
