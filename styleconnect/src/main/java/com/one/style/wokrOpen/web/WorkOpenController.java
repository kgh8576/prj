package com.one.style.wokrOpen.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.one.style.files.web.FilesController;
import com.one.style.wokrOpen.service.WorkOpenService;
import com.one.style.wokrOpen.vo.WorkOpenVO;

@Controller
public class WorkOpenController {
	
	@Autowired
	WorkOpenService workOpenDao;

	@RequestMapping("workTime.do")
	@ResponseBody
	public String[] workTime(WorkOpenVO vo, Model model) {
		return workOpenDao.getRealWorkOpenTime(vo);
	}

	@RequestMapping("fileUploadTest.do")
	public String uploadView(Model model) {
		return "test/FileTest";
	}

	@RequestMapping("/uploadTest.do")
	public String uploadTest(HttpServletRequest req) {
		FilesController fc = new FilesController();
		fc.upload(req,"cer");
		return "redirect:fileUploadTest.do";
	}

}
