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
	

	public int upload(HttpServletRequest req , String fileState) {
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)req;
		FilesVO vo = new FilesVO();
		String rootUploadDir = "C:\\Users\\kgh85\\git\\prj\\styleconnect\\src\\main\\webapp\\resources\\img"; // 업로드 주소
		File dir = new File(rootUploadDir);
		if (!dir.exists()) { // 업로드 디렉토리가 존재하지 않으면 생성
			dir.mkdirs();
		}
		Iterator<String> iterator = request.getFileNames(); // 업로드된 파일정보 수집(2개 - file1,file2)

		int fileLoop = 0;
		String uploadFileName;
		MultipartFile mFile = null;
		String orgFileName = ""; // 진짜 파일명
		String sysFileName = ""; // 변환된 파일명

		ArrayList<String> list = new ArrayList<String>();

		//그룹번호 생성
		int groupno = filesDao.cerGroupNo();
		while (iterator.hasNext()) {
			fileLoop++;

			uploadFileName = iterator.next();
			mFile = request.getFile(uploadFileName);

			orgFileName = mFile.getOriginalFilename();
			System.out.println(orgFileName);

			if (orgFileName != null && orgFileName.length() != 0) { // sysFileName 생성
				System.out.println("if문 진입");
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMDDHHmmss-" + fileLoop);
				Calendar calendar = Calendar.getInstance();
				sysFileName = simpleDateFormat.format(calendar.getTime()); // sysFileName: 날짜-fileLoop번호

				try {
					System.out.println("try 진입");
					mFile.transferTo(new File(dir + File.separator + sysFileName)); // C:/Upload/sysFileName
					list.add("원본파일명: " + orgFileName + ", 시스템파일명: " + sysFileName);
					vo.setDesGroupNo(groupno);
					vo.setFileName(orgFileName);
					vo.setFileUuid(sysFileName);
					vo.setFileState(fileState);
					filesDao.fileinsert(vo);
					// 첨부파일 테이블 저장
					// 파일테이블에 인설트

				} catch (Exception e) {
					list.add("파일 업로드 중 에러발생!!!");
				}
				
			} // if
		} // while

		for (String string : list) {
			System.out.println(string);
		}
		
		return groupno;
	}
	
}
