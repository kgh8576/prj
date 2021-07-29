package com.one.style.review.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.style.review.service.ReviewService;
import com.one.style.review.vo.ReviewVO;

@Controller
public class ReviewController {
	
	@Autowired ReviewService reviewDao;
	
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
	    model.addAttribute("reviewListPaging", reviewDao.reviewPaging(pvo));
	    model.addAttribute("paging", paging);
	    
		return "review/reviewList";
	}
	
	@RequestMapping("reviewInfo.do")
	public String reviewInfo(ReviewVO vo, Model model){
		model.addAttribute("reviewInfo", reviewDao.getReviewWriter(vo));
		return "review/reviewInfo";
	}
	
	@RequestMapping("reviewModify.do")
	public String reviewModify(ReviewVO vo, Model model) {
		if (reviewDao.canReviewModCheck(vo)) {
			model.addAttribute("conNo", vo.getConNo());
			return "review/reviewModify";	
		}
		return "main/home";
	}
	

	
	@RequestMapping("reviewRegister.do")
	public String reviewRegister(ReviewVO vo, Model model) {
		if (reviewDao.canReviewRegCheck(vo)) {
			model.addAttribute("conNo", vo.getConNo());
			return "review/reviewRegister";	
		}
		return "main/home";
	}
	
	
}
