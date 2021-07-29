package com.one.style.review.mapper;

import java.util.List;

import com.one.style.review.vo.ReviewVO;

public interface ReviewServiceMap {
	public ReviewVO reviewPersonalTotal(String name);
	public int reviewRating(String name);
	public List<ReviewVO> reviewPaging(ReviewVO vo);
	public ReviewVO getReviewWriter(ReviewVO vo);
	public void reviewDelete(ReviewVO vo);
	public ReviewVO canReviewModCheck(ReviewVO vo);
	public ReviewVO canReviewRegCheck(ReviewVO vo);
	public List<ReviewVO> canRegReviewList(String sessionId);
	public void reviewUpdate(ReviewVO vo);
	
}
