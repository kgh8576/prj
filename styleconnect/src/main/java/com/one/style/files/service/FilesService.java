package com.one.style.files.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.one.style.files.vo.FilesVO;

public interface FilesService {

	public void upload(MultipartHttpServletRequest req , String fileState,String des_id);
}
