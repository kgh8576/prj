package com.one.style.des.web;

import java.io.IOException;
import java.net.http.HttpResponse;
import java.util.UUID;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.one.style.des.service.DesService;
import com.one.style.des.vo.DesVO;
import com.one.style.files.service.FilesService;
import com.one.style.files.vo.FilesVO;

@Controller
public class DesController {

	@Autowired
	DesService desDao;
	
	@Autowired
	FilesService fileDao;
	
	//디자이너 로그인
	@RequestMapping("/desloginCheck.do")
	public String desloginCheck(HttpServletRequest request, HttpServletResponse response, DesVO vo) throws IOException {
		HttpSession session = request.getSession();
		DesVO dvo = new DesVO();
		dvo = desDao.designerlogin(vo);
		boolean b = desDao.designerloginCheck(vo);
		int cnt = 1;
		if(b) {
			cnt = 1;
			session.setAttribute("did", dvo.getId());
			session.setAttribute("user", dvo);
			response.getWriter().print(cnt);
		}else {
			cnt = 0;
			response.getWriter().print(cnt);
		}
		
		
		return null;
	}
	
	//디자이너 회우너가입페이지 이동
	@RequestMapping("/desinsertpage.do")
	public String desInsert() {
		return "designer/designerinsert";
	}
	//디자이너 회원아이디 중복검사
	@RequestMapping("/desinserinsertcheck.do")
	public String desinerinsertcheck (HttpServletRequest request,HttpServletResponse response,DesVO vo) throws IOException {
		String id = request.getParameter("id");
		vo.setId(id);
		System.out.println("디자이너 회원가입 아이디검사 = " + id);
		boolean b = desDao.designerinsertcheck(vo);
		int cnt = 1;
		if(b) {
			cnt = 1;
			response.getWriter().print(cnt);
		}
		else {
			cnt = 0;
			response.getWriter().print(cnt);
		}
		return null;
	}
	
	//디자이너 회원가입 실행
	@RequestMapping("/desinerinsert.do")
	public String desinerinsert(DesVO vo , HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		System.out.println(vo.getMakeupyn());
		String postcode = request.getParameter("postcode");
		String roadAddress = request.getParameter("roadAddress");
		String extraAddress = request.getParameter("extraAddress");
		String detailAddress = request.getParameter("detailAddress");
		
		String address ="("+ postcode +")"+ " "+ roadAddress + " " + extraAddress + " " + detailAddress;
		System.out.println(address);
		vo.setLocation(address);
		
		
		// 
		int groupno = upload(request);
		vo.setImggroupno(groupno);
		
		desDao.designerInsert(vo);
		
		session.setAttribute("did", vo.getId());
		
		return "redirect:main.do";
	}
	

		public int upload(HttpServletRequest req) {
			MultipartHttpServletRequest request = (MultipartHttpServletRequest)req;
			
			FilesVO vo = new FilesVO();
			
			String rootUploadDir = "C:" + File.separator + "upload"; // 업로드 주소

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
			
			int groupno= fileDao.cergroupno();
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
						fileDao.fileinsert(vo);
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
	
	//마이페이지
	@RequestMapping("mypage.do")
	public String mypage(HttpServletRequest request,Model model,DesVO vo) {
		HttpSession session = request.getSession();
		String desId = (String) session.getAttribute("id");
		vo.setId(desId);
		vo = desDao.selectDes(vo);
		model.addAttribute("des", desDao.selectDes(vo));
		return "desmypage/desMypage";
	}
	//마이페이지 - 내정보 관리
	@RequestMapping("desInfo.do")
	public String desInfo(HttpServletRequest request, Model model, DesVO vo) {
		HttpSession session = request.getSession();
		String desId = (String) session.getAttribute("id");
		vo.setId(desId);
		vo = desDao.selectDes(vo);
		model.addAttribute("des", desDao.selectDes(vo));
		return "desmypage/desInfo";
	}
	
	//마이페이지 - 내정보 관리 - 비밀번호 확인
	@RequestMapping("desPwCheck.do")
	public String desPwCheck(HttpServletRequest request, HttpServletResponse response, DesVO vo) throws IOException {
		HttpSession session = request.getSession();
		String desId = (String) session.getAttribute("id");
		vo.setId(desId);
		
		String desPw = request.getParameter("desPw");
		vo.setPw(desPw);
		System.out.println("==============비밀번호"+ desPw);
		boolean b = desDao.pwCheck(vo);
		int cnt =1;
		
		if(b) {
			cnt = 1;
			response.getWriter().print(cnt);
		}else {
			cnt = 0;
			response.getWriter().print(cnt);
		}
		return null;
	}
	
	@RequestMapping("desUpdate.do")
	public String desUpdate(HttpServletRequest request,Model model, DesVO vo ) {
		String hp = request.getParameter("hp");
		String loc = request.getParameter("location");
		String pw = request.getParameter("pw");
		String gender = request.getParameter("gender");
		
		vo.setHp(hp);
		vo.setLocation(loc);
		vo.setPw(pw);
		vo.setGender(gender);
		
		System.out.println("아이디 값 체크: " + vo.getId());
		
		int n = desDao.desUpdate(vo);
		
		System.out.println("업데이트 행 수: " + n);
		System.out.println("=============================="+pw);
		return "redirect:desInfo.do";
	}
	
	@RequestMapping("desStyle.do")
	public String desStyle(HttpServletRequest requset, Model model, DesVO vo) {
		
		return "desmypage/desStyle";
	}
	@RequestMapping("desSchedule.do")
	public String desSchedule(HttpServletRequest requset, Model model, DesVO vo) {
		
		return "desmypage/desSchedule";
	}
	@RequestMapping("desMajor.do")
	public String desMajor(HttpServletRequest requset, Model model, DesVO vo) {
		
		return "desmypage/desMajor";
	}
	
}
