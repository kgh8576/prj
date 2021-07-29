package com.one.style.review.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.one.style.review.service.ReviewService;
import com.one.style.review.vo.ReviewVO;

@RestController
public class AjaxReviewController {

	@Autowired ReviewService reviewDao;
	
	@RequestMapping("reviewDelete.do")
	public String reviewDelete(ReviewVO vo) {
		reviewDao.reviewDelete(vo);
		return null;
	}
	
	@RequestMapping("reviewUpdate.do")
	public String reviewUpdate(ReviewVO vo) {
		return null;
	}
}
