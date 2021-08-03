package com.one.style.files.service;

import javax.servlet.http.HttpServletRequest;

import com.one.style.files.vo.FilesVO;

public interface FilesService {

	public int upload(HttpServletRequest req , String fileState);
}
