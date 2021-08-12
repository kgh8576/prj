package com.one.style.des.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.StringUtils;
import org.apache.velocity.runtime.directive.Foreach;
import org.json.simple.JSONObject;
import org.jsoup.helper.StringUtil;
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
import com.one.style.dessearch.vo.DessearchVO;
import com.one.style.files.service.FilesService;
import com.one.style.mem.service.MemService;
import com.one.style.mem.vo.MemberVO;
import com.one.style.memdetail.service.MemdetailService;

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

	@Autowired
	MemService memDao;

	@Autowired
	MemdetailService memdetailDao;

	@RequestMapping("/desloginCheck.do")
	@ResponseBody
	public Map desloginCheck(HttpServletRequest request, HttpServletResponse response, DesVO vo) throws IOException {
		HttpSession session = request.getSession();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4);
		int cnt = 0;
		// 1.id로 단건조회
		DesVO dvo = desDao.designerlogin(vo);

		if (dvo != null) {

			boolean b = encoder.matches(vo.getPw(), dvo.getPw());

			if (b) {
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
		int b = desDao.designerinsertcheck(vo);
		int cnt = 1;

		if (b == 1) {
			cnt = 0;
			response.getWriter().print(cnt);
		} else {
			cnt = 1;
			response.getWriter().print(cnt);
		}
		return null;
	}

	// 패스워드 정규화검사
	@RequestMapping("sendpassword.do")
	@ResponseBody
	public Boolean sendpassword(HttpServletRequest request) {

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
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4);
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

	// 핸드폰번호 정규식
	@RequestMapping("realhpcheck.do")
	@ResponseBody
	public boolean realhpcheck(HttpServletRequest request) {

		String phoneNumber = request.getParameter("hp");
		String check = "^01(?:0|1|[6-9])[.-]?(\\d{3}|\\d{4})[.-]?(\\d{4})$";

		boolean finalcheck = Pattern.matches(check, phoneNumber);
		System.out.println(finalcheck);
		return finalcheck;

	}

	// 핸드폰인증번호
	@RequestMapping("sendSMS.do")
	@ResponseBody
	public String SendSMS(HttpServletRequest req) throws IOException {
		HttpSession session = req.getSession();
		String targetNum = req.getParameter("hp");
		Random rand = new Random();
		String textCode = "";
		for (int i = 0; i < 4; i++) {
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
		params.put("text", "고?" + textCode + " ");
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
		// 문자 전송시 세션시간확인
		session.setAttribute("sessiontime", System.currentTimeMillis());

		return null;
	}

	// 인증번호 인증

	@RequestMapping("checkSMS.do")
	@ResponseBody
	public Boolean checkSMS(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String insertCode = request.getParameter("insertCode");
		String Code = (String) session.getAttribute("textCode");
		Long sessiontime = (Long) session.getAttribute("sessiontime");
		Long realtime = System.currentTimeMillis();
		// 문자전송후 시간과 현재시간계산 3분 세션타임.
		Long difftime = (realtime - sessiontime) / 1000 / 60;

		boolean YorN = false;
		if (difftime > 3) {
			YorN = false;
			session.removeAttribute("textCode");
		} else if (insertCode.equals(Code)) {
			YorN = true;
		} else {
			YorN = false;
		}

		return YorN;
	}

}
