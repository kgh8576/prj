package com.one.style.des.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Random;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.style.des.service.DesService;
import com.one.style.des.vo.DesVO;
import com.one.style.files.service.FilesService;
import com.one.style.files.web.FilesController;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class DesController {

	@Autowired
	DesService desDao;
	
	@Autowired
	FilesService fileservice;
	
	@RequestMapping("/desloginCheck.do")
	public String desloginCheck(HttpServletRequest request, HttpServletResponse response, DesVO vo) throws IOException {
		HttpSession session = request.getSession();
		DesVO dvo = new DesVO();
		dvo = desDao.designerlogin(vo);
		boolean b = desDao.designerloginCheck(vo);
		int cnt = 1;
		if (b) {
			cnt = 1;
			session.setAttribute("did", dvo.getId());
			session.setAttribute("user", dvo);
			response.getWriter().print(cnt);
		} else {
			cnt = 0;
			response.getWriter().print(cnt);
		}

		return null;
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
	public String desinerinsert(DesVO vo, HttpServletRequest request) {

		HttpSession session = request.getSession();

		System.out.println(vo.getMakeupyn());
		String postcode = request.getParameter("postcode");
		String roadAddress = request.getParameter("roadAddress");
		String extraAddress = request.getParameter("extraAddress");
		String detailAddress = request.getParameter("detailAddress");

		String address = "(" + postcode + ")" + " " + roadAddress + " " + extraAddress + " " + detailAddress;
		System.out.println(address);
		vo.setLocation(address);
		desDao.designerInsert(vo);
//		fileservice.upload(request, "cer", vo.getId());
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
			String desId = (String) session.getAttribute("did");
			vo.setId(desId);
			model.addAttribute("des", desDao.selectDes(vo));
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
	@RequestMapping("desProUpdate.do")
	public String desProUpdate(HttpServletRequest request, DesVO vo) {
		desDao.desProUpdate(vo);
		
//		fileservice.upload(request, "pro");
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
	public String desMajor(HttpServletRequest request, Model model, DesVO vo) {
		HttpSession session = request.getSession();
		String desId = (String) session.getAttribute("did");
		vo.setId(desId);
		model.addAttribute("des", desDao.selectDes(vo));

		return "desmypage/desMajor";
	}
	
}
