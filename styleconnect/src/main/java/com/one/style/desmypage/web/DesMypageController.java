package com.one.style.desmypage.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.helper.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.des.service.DesService;
import com.one.style.des.vo.DesVO;
import com.one.style.desmypage.service.DesMypageService;
import com.one.style.desmypage.vo.DesMypageVO;
import com.one.style.dessearch.service.DessearchService;
import com.one.style.dessearch.vo.DessearchVO;
import com.one.style.files.service.FilesService;

@Controller
public class DesMypageController {

	@Autowired
	DesService desDao;

	@Autowired
	FilesService fileservice;

	@Autowired
	DessearchService desSearchDao;

	@Autowired
	DesMypageService desMyDao;

	// 마이페이지
	@RequestMapping("mypage.do")
	public String mypage(HttpServletRequest request, Model model, DesVO vo) {
		HttpSession session = request.getSession();
		String desId = (String) session.getAttribute("did");
		vo.setId(desId);
		vo = desDao.selectDes(vo);
		model.addAttribute("my", desDao.selectDes(vo));
		return "desmypage/desMypage";
	}

	// 마이페이지/내정보 관리페이지
	@RequestMapping("desInfo.do")
	public String desInfo(HttpServletRequest request, Model model, DesVO vo) {
		HttpSession session = request.getSession();
		String desId = (String) session.getAttribute("did");
		vo.setId(desId);
		model.addAttribute("des", desDao.selectDes(vo));
		model.addAttribute("despro", desMyDao.selectDesPro(vo));
		model.addAttribute("descer", desMyDao.selectDesCer(vo));
		return "desmypage/desInfo";
	}

	// 마이페이지/내정보 관리페이지 - 기본정보 업데이트
	@RequestMapping("desUpdate.do")
	public String desUpdate(MultipartHttpServletRequest request, Model model, DesVO vo) {
		// 기본정보
		if (vo.getMakeupyn() == null){
			vo.setMakeupyn("N");
		}
		if (vo.getCutyn() == null){
			vo.setCutyn("N");
		}
		if (vo.getPermyn() == null){
			vo.setPermyn("N");
		}
		if (vo.getCutyn() == null){
			vo.setDyeyn("N");
		}
		
		desMyDao.desUpdate(vo);

		return "redirect:desInfo.do";
	}

	// 마이페이지/비밀번호변경 페이지
	@RequestMapping("/despwchangepage.do")
	public String pwchangepage() {
		return "desmypage/pwchangepage";
	}

	// 마이페이지/비밀번호변경 페이지 - 비밀번호변경
	@RequestMapping("/despwchange.do")
	@ResponseBody
	public int pwchange(HttpServletRequest request, DesVO vo) {
		// 세션에있는 아이디를 가지고온다
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("did");
		vo.setId(id);
		// 비밀번호 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4);
		String pw = request.getParameter("gupw");
		String newpassword = request.getParameter("pw");
		// 암호화시킨 기존비밀번호
		// String encoderPW = encoder.encode(pw);
		// 암호화시킨 새로운비밀번호
		String NEWencoderPW = encoder.encode(newpassword);
		// 결과값리턴을 위해서 cnt 선언
		int cnt = 0;
		// DB에 있는 password값 가지고오기
		DesVO dvo = desDao.designerlogin(vo);
		// 입력들어온 pw값과 DB에 있는 password 값을 비교 맞으면 true / 틀리면 false
		boolean b = encoder.matches(pw, dvo.getPw());
		// 비교한 패스워드가 같을경우
		if (b) {
			// vo에 암호화된 새로운 PW 를 넣고
			vo.setPw(NEWencoderPW);
			// 비밀번호 업데이트시킴
			desMyDao.pwchange(vo);
			cnt = 1;
		}

		return cnt;
	}

	// 마이페이지/내정보 관리페이지 - 자격증 파일 등록
	@RequestMapping("desCerUp.do")
	public String desCerUp(MultipartHttpServletRequest request, DesVO vo) {
		HttpSession session = request.getSession();
		String desId = (String) session.getAttribute("did");
		vo.setId(desId);
		fileservice.upload(request, "cer", desId);
		return "redirect:desInfo.do";
	}

	// 마이페이지/내정보 관리페이지 - 자격증 파일 재첨부
	@RequestMapping("desCerUpdate.do")
	public String desCerUpdate(MultipartHttpServletRequest request, DesVO vo) {
		HttpSession session = request.getSession();
		String desId = (String) session.getAttribute("did");
		String uuid = request.getParameter("fileUuid");
		vo.setId(desId);
		vo.setFileUuid(uuid);

		desMyDao.desFileUpdate(vo);
		fileservice.upload(request, "cer", desId);
		return "redirect:desInfo.do";
	}

	// 마이페이지/내정보 관리페이지 - 프로필사진 등록
	@RequestMapping("desProUp.do")
	public String desProUp(MultipartHttpServletRequest request, DesVO vo) {
		HttpSession session = request.getSession();
		String desId = (String) session.getAttribute("did");
		vo.setId(desId);
		fileservice.upload(request, "pro", desId);
		return "redirect:desInfo.do";
	}

	// 마이페이지/내정보 관리페이지 - 프로필사진 수정
	@RequestMapping("desProUpdate.do")
	public String desProUpdate(MultipartHttpServletRequest request, DesVO vo) {
		HttpSession session = request.getSession();
		String desId = (String) session.getAttribute("did");
		String uuid = request.getParameter("fileUuid");
		vo.setId(desId);
		vo.setFileUuid(uuid);

		desMyDao.desFileUpdate(vo);
		fileservice.upload(request, "pro", desId);
		return "redirect:desInfo.do";
	}

	// 마이페이지/전문분야설정페이지
	@RequestMapping("desMajor.do")
	public String desMajor(HttpServletRequest request, Model model, DesVO vo) {
		HttpSession session = request.getSession();
		String desId = (String) session.getAttribute("did");
		String major = (String) session.getAttribute("major");
		vo.setId(desId);
		vo.setMajor(major);
		model.addAttribute("des", desDao.selectDes(vo));

		return "desmypage/desMajor";
	}

	// 마이페이지/전문분야설정페이지 - major수정
	@RequestMapping("majorUpdate.do")
	public String majorUpdate(HttpServletRequest request, DesVO vo) {
		vo.setId(request.getParameter("id"));
		String[] major = request.getParameterValues("major");
		// 문자열 합치기
		List<String> majors = new ArrayList<String>();
		majors.add(major[0]);
		majors.add(major[1]);
		majors.add(major[2]);
		String seperatedToComma = StringUtil.join(majors, ",");
		vo.setMajor(seperatedToComma);

		desMyDao.desmajorUpdate(vo);
		return "redirect:desMajor.do";
	}

	// 마이페이지/스타일링 관리페이지
	@RequestMapping("desStyle.do")
	public String desStyle(Model model, DesVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String desId = (String) session.getAttribute("did");
		vo.setId(desId);
		model.addAttribute("sty", desMyDao.selectDesSty(vo));
		return "desmypage/desStyle";
	}
	// 마이페이지/스타일링 관리페이지 - 스타일링 등록
	@RequestMapping("desStyleUp.do")
	public String desStyleUp(Model model, DesVO vo, MultipartHttpServletRequest request) {
			HttpSession session = request.getSession();
			String desId = (String) session.getAttribute("did");
			vo.setId(desId);
			fileservice.upload(request, "sty", desId);
		return "redirect:desStyle.do";
		}
	// 마이페이지 /스타일링 관리페이지 - 스타일 삭제
	@RequestMapping("desStyleDel.do")
	public String desStyleDel(DesVO vo) {
		desMyDao.desFileUpdate(vo);
		return "redirect:desStyle.do";
	}
	// 마이페이지/예약 관리페이지
	//구자혁이 수정한거임~~~~~~~~~~~~~~~~~~~~~~~~~~
	@RequestMapping("desSchedule.do")
	public String desSchedule( Model model, ConHistoryVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		vo.setDesId((String) session.getAttribute("did"));
		if (vo.getState() == null) {
			vo.setState("ccode001");
		}
		model.addAttribute("state", vo.getState());
		model.addAttribute("sche",desMyDao.desScheList(vo));
		return "desmypage/desSchedule";
	}
	//~~~~~~~~~~~~~~~~~~~~~~~~~~여기까지 수정한거임
	//마이페이지/예약 관리페이지 - 상담 승인
	@RequestMapping("desApprove.do")
	public String desApprove(ConHistoryVO vo) {
		desMyDao.desApprove(vo);
		return "redirect:desSchedule.do";
	}
	//마이페이지/예약 관리페이지 - 상담 거부
	@RequestMapping("desDeny.do")
	public String desDeny(ConHistoryVO vo) {
		desMyDao.desDeny(vo);
		return "redirect:desSchedule.do";
	}

	// 마이페이지/상담목록 관리페이지
	@RequestMapping("desCourse.do")
	public String desCourse(Model model, DesVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String desId = (String) session.getAttribute("did");
		vo.setId(desId);
		model.addAttribute("course", desMyDao.desCourseList(vo));
		return "desmypage/desCourse"; 
	}

	// 마이페이지/상담목록 관리페이지/상담생성 페이지
	@RequestMapping("desCourseRegister.do")
	public String desCourseRegister(Model model, DessearchVO vo) {
		return "desmypage/desCourseRegister";
	}

	// 마이페이지/상담목록 관리페이지/상담생성 페이지 - 상담등록
	@RequestMapping("desCourseInsert.do")
	public String desCourseInsert(Model model, DesVO vo, MultipartHttpServletRequest request) {
		List<MultipartFile> files = request.getFiles("file");
		for (MultipartFile file : files) {
			if(file.getOriginalFilename() != null && file.getOriginalFilename().length() != 0) {
				fileservice.upload(request, "thum", vo.getId(), desMyDao.desCourSeq().getCourNo());
			}
		}
		desMyDao.desCourseInsert(vo);
		return "redirect:desCourse.do?id="+vo.getId();
	}

	// 마이페이지/상담목록 관리페이지/삼담수정페이지
	@RequestMapping("desCourseUpdate.do")
	public String desCourseUpdate(Model model, DesVO vo) {
		model.addAttribute("course", desMyDao.desCourseSelect(vo));
		return "desmypage/desCourseUpdate";
	}
	// 마이페이지/상담목록 관리페이지/상담수정페이지 - 상담 수정
	@RequestMapping("desCourseUp.do")
	public String desCourseUpdate(Model model,DesVO vo, MultipartHttpServletRequest request) {
		List<MultipartFile> files = request.getFiles("file");
		for (MultipartFile file : files) {
			if(file.getOriginalFilename() != null && file.getOriginalFilename().length() != 0) {
				System.out.println("111111111111");
				desMyDao.desFileUpdate(vo);
				fileservice.upload(request, "thum", vo.getId(),vo.getCourNo());
			}
		}
		desMyDao.desCourseUpdate(vo);
		return "redirect:desCourseUpdate.do?courNo="+vo.getCourNo();
	}

	
	// 마이페이지/상담시간설정 진입 / 가져오는 쿼리
	@RequestMapping("desWorkOpen.do")
	public String desWorkOpenPage(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String did = (String) session.getAttribute("did");
		model.addAttribute("schedules", desMyDao.desWorkOpenPage(did));
		return "desmypage/desWorkOpen";
	}
	// 마이페이지/상담시간설정 (월화수목금토 Update)
	@RequestMapping("desWorkOpenUpdate.do")
	public String desWorkOpenUpdate(HttpServletRequest req , DesMypageVO vo) {
		HttpSession session = req.getSession();
		if(vo.getTime() == null) {
			vo.setTimes("");
		} else {
			vo.setTimes(String.join(",", vo.getTime())); 
		}
		String did = (String) session.getAttribute("did");
		vo.setId(did);
		desMyDao.desWorkOpenUpdate(vo);
		return "redirect:desWorkOpen.do";
	}

	//회원탈퇴페이지이동
		@RequestMapping("desexitpage.do")
		public String exitpage () {
			return "desmypage/desexit";
		}
		//회원탈퇴
		@RequestMapping("desexit.do")
		@ResponseBody
		public int desexit (DesVO vo, HttpServletRequest request) {
			//세션에있는 ID값호출
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("did");
			//아이디값 vo객체에 담아줌
			vo.setId(id);
			//암호화
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4);
			//ID와 PASSWORD MVO에 담아줌
			DesVO mvo = desDao.designerlogin(vo);
			//VO(입력받은 비밀번호값)과 MVO(DB에 저장된 비밀번호값)매칭확인
			boolean b = encoder.matches(vo.getPw(), mvo.getPw());
			int YorN = 0;
			//매칭해서 TRUE가 나온다면
			if(b) {
				//회원정보삭제 실행
				desMyDao.desexit(mvo);
				YorN = 1;
				//세션끊기
				session.invalidate();
				
			}
			//1OR2를 리턴해줌
			System.out.println(YorN);
			return YorN;
		}
		
}

