package com.one.style.review.web;

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
	public String reviewPage(Model model, @RequestParam(value="name") String name,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="pullValue", defaultValue="byDate") String pullValue){
		ReviewVO tvo = reviewDao.reviewPersonalTotal(name);
		int rate = reviewDao.reviewRating(name);
		model.addAttribute("total", tvo.getCount());
		model.addAttribute("name", name);
		model.addAttribute("rate", rate);
		
		// 리뷰 4건씩 페이징 처리
		ReviewVO pvo = new ReviewVO();
		pvo.setFirstCnt((page-1)*4+1);
		pvo.setLastCnt(page*4);
		pvo.setPullValue(pullValue);
		pvo.setName(name);
		
		
		System.out.println(pvo.getFirstCnt());
		System.out.println(pvo.getLastCnt());
		System.out.println(pvo.getPullValue());
		System.out.println(pvo.getName());
		
		
	    Paging paging = new Paging();
	    paging.setPageNo(page);
	    paging.setPageSize(4);
	    paging.setTotalCount(tvo.getCount());
	    
	    model.addAttribute("reviewListPaging", reviewDao.reviewPaging(pvo));
	    model.addAttribute("paging", paging);
	    
		return "review/reviewList";
	}
	
	@RequestMapping("reviewInfo.do")
	public String reviewInfo(){
		return "review/reviewInfo";
	}
	
}
