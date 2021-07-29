package com.one.style.review.service;

import java.util.List;

import com.one.style.review.vo.ReviewVO;

public interface ReviewService {
	public ReviewVO reviewPersonalTotal(String name);
	public int reviewRating(String name);
	public List<ReviewVO> reviewPaging(ReviewVO vo);
	public ReviewVO getReviewWriter(ReviewVO vo);
	public void reviewDelete(ReviewVO vo);
	public boolean canReviewModCheck(ReviewVO vo);
	public boolean canReviewRegCheck(ReviewVO vo);
	public List<ReviewVO> canRegReviewList(String sessionId);
	public void reviewUpdate(ReviewVO vo);
}
