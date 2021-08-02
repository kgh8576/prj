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

import com.one.style.wokrOpen.service.WorkOpenService;
import com.one.style.wokrOpen.vo.WorkOpenVO;

@Controller
public class WorkOpenController {
	private static final String ROOT_PATH = "C:\\Users\\admin\\git\\prj\\styleconnect\\src\\main\\";
	@Autowired
	WorkOpenService workOpenDao;

	@RequestMapping("workTime.do")
	@ResponseBody
	public String[] workTime(WorkOpenVO vo, Model model) {
		return workOpenDao.getRealWorkOpenTime(vo);
	}

	@RequestMapping("fileUploadTest.do")
	public String uploadView(Model model) {
		try {
			ResourceUtils.getURL("classpath:resources\\img\\0134a297-de83-4fa0-88c9-6330a7004f3f.png");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "test/FileTest";
	}

	@RequestMapping("/uploadTest.do")
	public String upload(@RequestParam("file") MultipartFile file ,HttpServletRequest req) {
		System.out.println("파일 이름 : " + file.getOriginalFilename());
		System.out.println("파일 크기 : " + file.getSize());
		String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."), file.getOriginalFilename().length());
		UUID uuid = UUID.randomUUID();
		String newFileName = uuid.toString() + extension;
		String savePath = "resources\\img\\";
		String saveFile = ROOT_PATH+ savePath  + newFileName;
		try { 
			file.transferTo(new File(saveFile));
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return "redirect:fileUploadTest.do";
	}

}
