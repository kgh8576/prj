package com.one.style.files.web;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.one.style.files.service.FilesService;
import com.one.style.files.vo.FilesVO;

@Controller
public class FilesController {
	
	@Autowired
	FilesService filesDao;
	

	
	
}
