package com.one.style.des.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.velocity.runtime.directive.Foreach;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.one.style.des.service.DesService;
import com.one.style.des.vo.DesVO;
import com.one.style.dessearch.service.DessearchService;
import com.one.style.files.service.FilesService;

import edu.emory.mathcs.backport.java.util.Collections;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class DesController {

	@Autowired
	DesService desDao;
	
	@Autowired
	FilesService fileservice;
	
	@Autowired
	DessearchService desSearchDao;
	
	@RequestMapping("/desloginCheck.do")
	@ResponseBody
	public Map desloginCheck(HttpServletRequest request, HttpServletResponse response, DesVO vo) throws IOException {
		HttpSession session = request.getSession();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
		int cnt = 0;
		//1.id로 단건조회
		DesVO dvo = desDao.designerlogin(vo);
		
		if (dvo != null) {
			
			boolean b = encoder.matches(vo.getPw(), dvo.getPw());
			
			if(b) {
				cnt = 1;
				session.setAttribute("did", dvo.getId());
				session.setAttribute("user", dvo);
			}
		}
		
		return Collections.singletonMap("result", cnt);
	}

	// 디자이너 회우너가입페이지 이동
	@RequestMapping("/desinsertpage.do")
	public String desInsert() {
		return "designer/designerinsert";
	}

	// 디자이너 회원아이디 중복검사
	@RequestMapping("/desinserinsertcheck.do")
	public String desinerinsertcheck(HttpServletRequest request, HttpServletResponse response, DesVO vo)
			throws IOException {
		String id = request.getParameter("id");
		vo.setId(id);
		System.out.println("디자이너 회원가입 아이디검사 = " + id);
		boolean b = desDao.designerinsertcheck(vo);
		int cnt = 1;
		if (b) {
			cnt = 1;
			response.getWriter().print(cnt);
		} else {
			cnt = 0;
			response.getWriter().print(cnt);
		}
		return null;
	}
	
	//패스워드 정규화검사
	@RequestMapping("sendpassword.do")
	@ResponseBody
	public Boolean sendpassword (HttpServletRequest request) {
		
		String password = request.getParameter("pw");
		String check = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d~!@#$%^&*()+|=]{8,20}$";
		
		boolean finalcheck = Pattern.matches(check, password);
		System.out.println(finalcheck);
		return finalcheck;		
		
	}
	// 디자이너 회원가입 실행
	@RequestMapping("/desinerinsert.do")
	public String desinerinsert(DesVO vo, MultipartHttpServletRequest request) {

		HttpSession session = request.getSession();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
		String postcode = request.getParameter("postcode");
		String roadAddress = request.getParameter("roadAddress");
		String extraAddress = request.getParameter("extraAddress");
		String detailAddress = request.getParameter("detailAddress");
		String endoerPw = encoder.encode(vo.getPw());
		vo.setPw(endoerPw);

		String address = "(" + postcode + ")" + " " + roadAddress + " " + extraAddress + " " + detailAddress;
		vo.setLocation(address);
		desDao.designerInsert(vo);
		fileservice.upload(request, "cer", vo.getId());
		session.setAttribute("did", vo.getId());

		return "redirect:main.do";
	}
	//핸드폰번호 정규식
	@RequestMapping("realhpcheck.do")
	@ResponseBody
	public boolean realhpcheck (HttpServletRequest request) {
		
		String phoneNumber = request.getParameter("hp");
		String check = "^01(?:0|1|[6-9])[.-]?(\\d{3}|\\d{4})[.-]?(\\d{4})$";
		
		boolean finalcheck = Pattern.matches(check, phoneNumber);
		System.out.println(finalcheck);
		return finalcheck;		
		
	}
	//핸드폰인증번호
	@RequestMapping("sendSMS.do")
	@ResponseBody
	public String SendSMS (HttpServletRequest req) throws IOException {
		HttpSession session = req.getSession();
		String targetNum = req.getParameter("hp");
		Random rand = new Random();
		String textCode = "";
		for(int i=0; i<4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			textCode += ran;
		}
		
		String api_key = "NCSVASOPKECZYZIF";
		String api_secret = "SPLU6MAYGHQOZRJPOCQ1FJ62XALYQMLJ";
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", targetNum);
		params.put("from", "01055313076");
		params.put("type", "SMS");
		params.put("text", "Style Connect 인증번호는 " + textCode + " 입니다.");
		params.put("petMart", "petMart v1.0"); // application name and version
		
		System.out.println(params.get("text"));
		
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
		session.setAttribute("textCode", textCode);
		//문자 전송시 세션시간확인
		session.setAttribute("sessiontime", System.currentTimeMillis());
		
		return null;
	}
	
	//인증번호 인증
	
	@RequestMapping("checkSMS.do")
	@ResponseBody
	public Boolean checkSMS(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String insertCode = request.getParameter("insertCode");
		String Code = (String) session.getAttribute("textCode");
		Long sessiontime = (Long) session.getAttribute("sessiontime");
		Long realtime = System.currentTimeMillis();
		// 문자전송후 시간과 현재시간계산 3분 세션타임.
		Long difftime = (realtime - sessiontime)/1000/60;
		
		boolean YorN = true;
		if(difftime > 3) {
			YorN = false;
			session.removeAttribute("textCode");
		} else if(insertCode .equals(Code)) {
			YorN = true;
		}else {
			YorN = false;
		}
		
		
		return YorN;
	}
	
	//마이페이지
	@RequestMapping("mypage.do")
	public String mypage(HttpServletRequest request,Model model,DesVO vo) {
		HttpSession session = request.getSession();
		String desId = (String) session.getAttribute("did");
		vo.setId(desId);
		vo = desDao.selectDes(vo);
		return "desmypage/desMypage";
	}
	
	//마이페이지 - 내정보 관리
		@RequestMapping("desInfo.do")
		public String desInfo(HttpServletRequest request, Model model, DesVO vo) {
			HttpSession session = request.getSession();
			String desId = (String)session.getAttribute("did");
			vo.setId(desId);
			model.addAttribute("des", desDao.selectDes(vo));
			model.addAttribute("despro", desDao.selectDesPro(vo));
			return "desmypage/desInfo";
		}
	
	//마이페이지 - 내정보 관리 - 비밀번호 확인
		@RequestMapping("desPwCheck.do")
		public String desPwCheck(HttpServletRequest request, HttpServletResponse response, DesVO vo) throws IOException {
			HttpSession session = request.getSession();
			String desId = (String) session.getAttribute("did");
			vo.setId(desId);

			String desPw = request.getParameter("desPw");
			return "desmypage/desSchedule";
		}
	//마이페이지>기본정보 업데이트
	@RequestMapping("desUpdate.do")
	public String desUpdate(HttpServletRequest request,Model model, DesVO vo ) {
		String hp = request.getParameter("hp");
		String loc = request.getParameter("location");
		String pw = request.getParameter("pw");
		
		vo.setHp(hp);
		vo.setLocation(loc);
		vo.setPw(pw);
		
		System.out.println("아이디 값 체크: " + vo.getId());
		
		int n = desDao.desUpdate(vo);
		
		System.out.println("업데이트 행 수: " + n);
		System.out.println("=============================="+pw);
		return "redirect:desInfo.do";
	}
	//마이페이지 major수정 
	@RequestMapping("majorUpdate.do")
	public String majorUpdate(HttpServletRequest request, DesVO vo) {
		//System.out.println(request.getParameter("major"));
		String[] major = request.getParameterValues("major");
		
		//vo.setMajor(major);
		for (String string : major) {
			System.out.println(string);
			System.out.println(major[0]);
		}
		
		return "redirect:desMajor.do";
	}
	//프로필사진 수정
	@RequestMapping("desProUpdate.do")
	public String desProUpdate(MultipartHttpServletRequest request, DesVO vo) {
		HttpSession session = request.getSession();
		String desId = (String) session.getAttribute("did");
		String uuid = request.getParameter("fileUuid");
		vo.setId(desId);
		vo.setFileUuid(uuid);
		
		desDao.desProUpdate(vo);
		fileservice.upload(request, "pro", desId);
		return "redirect:desInfo.do";
	}
	//프로필사진 등록
	@RequestMapping("desProUp.do")
	public String desProUp(MultipartHttpServletRequest request, DesVO vo) {
		HttpSession session = request.getSession();
		String desId = (String) session.getAttribute("did");
		vo.setId(desId);
		System.out.println("==========================="+desId);
		fileservice.upload(request,"pro",desId);
		System.out.println();
		return "redirect:desInfo.do";
	}
	
	@RequestMapping("desStyle.do")
	public String desStyle(HttpServletRequest request, Model model, DesVO vo) {
		
		return "desmypage/desStyle";
	}
	@RequestMapping("desSchedule.do")
	public String desSchedule(HttpServletRequest request, Model model, DesVO vo) {
		
		return "desmypage/desSchedule";
	}
	@RequestMapping("desMajor.do")
	public String desMajor(HttpServletRequest request, Model model, DesVO vo) {
		HttpSession session = request.getSession();
		String desId = (String) session.getAttribute("did");
		String major  = (String) session.getAttribute("major");
		vo.setId(desId);
		vo.setMajor(major);
		model.addAttribute("des", desDao.selectDes(vo));
		System.out.println("=================아이디"+desId);
		
		return "desmypage/desMajor";
	}
	
}
