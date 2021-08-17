package com.one.style.home.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.style.crawldata.service.CrawlDataService;
import com.one.style.home.service.HomeService;
import com.one.style.home.vo.HomeVO;
import com.one.style.mem.service.MemService;
import com.one.style.mem.vo.MemDetailVO;

import edu.emory.mathcs.backport.java.util.TreeSet;

@Controller
public class HomeController {
	
	@Autowired
	MemService memberDao;
	@Autowired
	HomeService homeDao;
	@Autowired
	CrawlDataService crawlDao;
	
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest req) {
		// 로그인되어 있는 경우 추천 디자이너 뿌리기
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		if (id != null) {
			MemDetailVO memDetail = homeDao.memDetail(id);
			model.addAttribute("memDetail", memDetail);
			if (memDetail != null) {
				model.addAttribute("rcmdDesByConHis", homeDao.rcmdDesByConHis(memDetail));
				model.addAttribute("rcmdDesByRate", homeDao.rcmdDesByRate(memDetail));
			}
		}
		
		
		
		model.addAttribute("hashTag", crawlDao.getCrawlList("MALE"));
		return "main/home";
	}
	//카카오로그인
	@RequestMapping("kakaologin.do")
	public String kakaohome(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		session.setAttribute("id", id);
		
		return "redirect:main.do";
		
	}
	
	@RequestMapping("errorPage.do")
	public String errorPage() {
		return "main/error";
	}
	
	@RequestMapping("searchKeywordsList.do")
	@ResponseBody
	public List<HomeVO> searchKeywordsList(String inputKeywords) {
		
		String[] CHO = {"ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ", "ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"};
		String[] JOONG = {"ㅏ","ㅐ","ㅑ","ㅒ","ㅓ","ㅔ","ㅕ","ㅖ","ㅗ","ㅘ", "ㅙ","ㅚ","ㅛ","ㅜ","ㅝ","ㅞ","ㅟ","ㅠ","ㅡ","ㅢ","ㅣ"};
		String[] JONG = {"","ㄱ","ㄲ","ㄳ","ㄴ","ㄵ","ㄶ","ㄷ","ㄹ","ㄺ","ㄻ","ㄼ", "ㄽ","ㄾ","ㄿ","ㅀ","ㅁ","ㅂ","ㅄ","ㅅ","ㅆ","ㅇ","ㅈ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"};

		String[] slicedStr;
		List<HomeVO> keywords = homeDao.searchKeywordsList();
		List<HomeVO> keywordsAfterSliced = new ArrayList<HomeVO>();
		List<HomeVO> out = new ArrayList<HomeVO>();
		for (int i = 0; i < keywords.size(); i++) {
			if( keywords.get(i).getCategory().equals("major") ) { // 만약 for문 돌다가 category가 major인걸 찾으면 콤마 단위로 잘라라
				System.out.println( keywords.get(i).getMajor() );
				slicedStr = keywords.get(i).getMajor().split(",");
				for (int j = 0; j < slicedStr.length; j++) {
					HomeVO vo = new HomeVO();
					vo.setCategory("major");
					vo.setMajor(slicedStr[j]);
					vo.setPlaneKeyword(slicedStr[j]);
					keywordsAfterSliced.add(vo);
				}
			}
		}
		
		String strAdd = "";
		
		for( HomeVO ele : keywordsAfterSliced ) {
			String zaso = ele.getMajor();
			strAdd = "";
			for (int j = 0; j < zaso.length(); j++) {
				char targetChar = zaso.charAt(j); // 무슨컷 일 경우 무, 슨, 컷 for 돌면서 실행 ㅁㅜㅅㅡㄴㅋㅓㅅ 으로 만듦
				if(targetChar >= 0xAC00) { // 한글이라면
					int uniVal = targetChar - 0xAC00;
					int cho = ((uniVal)/(28*21)); // 초성
					int joong = ((uniVal%(28*21))/28); // 중성
					int jong = (uniVal % 28); // 종성\
					strAdd += CHO[cho]+JOONG[joong]+JONG[jong];
				}
			}
			ele.setMajor(strAdd);
			System.out.println(ele.getMajor());
		}
		
		for (int j = 0; j < inputKeywords.length(); j++) {
			strAdd = "";
			char targetChar = inputKeywords.charAt(j); // 무슨컷 일 경우 무, 슨, 컷 for 돌면서 실행 ㅁㅜㅅㅡㄴㅋㅓㅅ 으로 만듦
			if(targetChar >= 0xAC00) { // 한글이라면
				int uniVal = targetChar - 0xAC00;
				int cho = ((uniVal)/(28*21)); // 초성
				int joong = ((uniVal%(28*21))/28); // 중성
				int jong = (uniVal % 28); // 종성\
				strAdd += CHO[cho]+JOONG[joong]+JONG[jong];
			}
		}
		inputKeywords = strAdd;
		
		for( HomeVO ele : keywordsAfterSliced ) {
			if ( ele.getMajor().contains(inputKeywords) ) {
				out.add(ele);
			}
		}
		return out;
		
//		HashSet<FileVO> listSet = new HashSet<FileVO>(list);
//		Arraylist<FileVO> processedList = new Arraylist<FileVO>( listSet);
//		
//		return distinctOut;
	}
		
}
