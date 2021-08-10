package com.one.style.review.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.style.reply.service.ReplyService;
import com.one.style.review.service.ReviewService;
import com.one.style.review.vo.ReviewVO;

@Controller
public class ReviewController {
	
	@Autowired ReviewService reviewDao;
	@Autowired ReplyService replyDao;
	
	@RequestMapping("reviewList.do")
	public String reviewPage(Model model, @RequestParam(value="desId") String desId,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="pullValue", defaultValue="byDate") String pullValue,
			HttpServletRequest req){
		
		ReviewVO tvo = reviewDao.reviewPersonalTotal(desId);
		int rate = reviewDao.reviewRating(desId);
		model.addAttribute("total", tvo.getCount());
		//model.addAttribute("name", name);
		model.addAttribute("rate", rate);
		model.addAttribute("desId", desId);
		// 리뷰 4건씩 페이징 처리
		ReviewVO pvo = new ReviewVO();
		pvo.setFirstCnt((page-1)*4+1);
		pvo.setLastCnt(page*4);
		pvo.setPullValue(pullValue);
		pvo.setDesId(desId);
	    Paging paging = new Paging();
	    paging.setPageNo(page);
	    paging.setPageSize(4);
	    paging.setTotalCount(tvo.getCount());
	    
	    List<ReviewVO> reviewListPaging = reviewDao.reviewPaging(pvo);
	    model.addAttribute("reviewListPaging", reviewListPaging);
	    model.addAttribute("paging", paging);
	    model.addAttribute("desName", reviewListPaging.get(0).getName());
	    
		return "review/reviewList";
	}
	// 리뷰 상세보기
	@RequestMapping("reviewInfo.do")
	public String reviewInfo(ReviewVO vo, Model model){
		model.addAttribute("reviewInfo", reviewDao.getReviewWriter(vo));
		if(replyDao.getReply(vo) != null) { // 답장 있으면 답장도 같이 가져오기
			model.addAttribute("replyInfo", replyDao.getReply(vo));	
		}
		return "review/reviewInfo";
	}
	// 리뷰 수정 페이지
	@RequestMapping("reviewModify.do") // 리뷰 수정. 수정은 제한 X 
	public String reviewModify(ReviewVO vo, Model model) {
		model.addAttribute("conNo", vo.getConNo());
		model.addAttribute("reviewInfo", reviewDao.getHistoryForModify(vo));
		return "review/reviewModify";	
	}

	// 리뷰 작성 페이지
	@RequestMapping("reviewRegister.do") // 리뷰 작성
	public String reviewRegister(String id, int conNo, Model model) {
		ReviewVO vo = new ReviewVO();
		vo.setMemId(id);
		vo.setConNo(conNo); // 더미 
		if (reviewDao.canReviewRegCheckDate(vo) && reviewDao.canReviewRegCheckExist(vo) ) {  // 컨설팅 일자 이후 3일 이내이면서, 리뷰가 존재하지 않는 경우 등록 가능
			model.addAttribute("conNo", vo.getConNo());
			model.addAttribute("consultInfo", reviewDao.getHistoryForInsert(vo));
			reviewDao.reviewPoint(vo.getMemId()); // 포인트 적립
			return "review/reviewRegister";	
		}
		return "main/home";
	}
	@RequestMapping("reviewcheck.do")
	@ResponseBody
	public int reviewcheck(HttpServletRequest request) {
		
		return 1;
	}
	
}
