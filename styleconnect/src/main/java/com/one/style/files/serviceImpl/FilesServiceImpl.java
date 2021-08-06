package com.one.style.files.serviceImpl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.one.style.files.mapper.FilesMapper;
import com.one.style.files.service.FilesService;
import com.one.style.files.vo.FilesVO;

@Service
public class FilesServiceImpl implements FilesService {
	
	@Autowired 
	FilesMapper map;

	//전송할 파일 요충 req /파일 종류 fileState /파일 소유 디자이너 des_id
	public void upload(MultipartHttpServletRequest req , String fileState ,String des_id) {
		System.out.println("=============================================실행체크");
		MultipartHttpServletRequest request = req;
		FilesVO vo = new FilesVO();
		
		String rootUploadDir = req.getSession().getServletContext().getRealPath("/resources/img");; // 업로드 주소
		System.out.println(rootUploadDir);
		File dir = new File(rootUploadDir);
		if (!dir.exists()) { // 업로드 디렉토리가 존재하지 않으면 생성
			dir.mkdirs();
		}
		List<MultipartFile> files = request.getFiles("file"); // 업로드된 파일정보 수집(2개 - file1,file2)
		
		int fileLoop = 0;
		String uploadFileName;
		MultipartFile mFile = null;
		String orgFileName = ""; // 진짜 파일명
		String sysFileName = ""; // 변환된 파일명

		System.out.println("----------------------"+orgFileName);
		ArrayList<String> list = new ArrayList<String>();
		for (MultipartFile file : files)  {
			fileLoop++;


			orgFileName = file.getOriginalFilename();
			String extension = orgFileName.substring(orgFileName.lastIndexOf("."),orgFileName.length());
			if (orgFileName != null && orgFileName.length() != 0) { // sysFileName 생성
				System.out.println("if문 진입");
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMDDHHmmss-" + fileLoop);
				Calendar calendar = Calendar.getInstance();
				sysFileName = simpleDateFormat.format(calendar.getTime())+extension; // sysFileName: 날짜-fileLoop번호

				try {
					System.out.println("try 진입");
					file.transferTo(new File(dir + File.separator + sysFileName)); // C:\\Users\\admin\\git\\prj\\styleconnect\\src\\main\\webapp\\resources\\img
					// 첨부파일 테이블 저장
					// 파일테이블에 인설트
					list.add("원본파일명: " + orgFileName + ", 시스템파일명: " + sysFileName);
					vo.setDes_id(des_id);
					vo.setFileName(orgFileName);
					vo.setFileUuid(sysFileName);
					vo.setFileState(fileState);
					
					map.fileinsert(vo);
				} catch (Exception e) {
					list.add("파일 업로드 중 에러발생!!!");
				}
				
			} // if
		} // while

		for (String string : list) {
			System.out.println(string);
		}
	}
}
