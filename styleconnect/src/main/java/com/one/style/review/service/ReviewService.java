package com.one.style.review.service;

import java.util.List;

import com.one.style.review.vo.ReviewVO;

public interface ReviewService {
	public ReviewVO reviewPersonalTotal(String name);
	public int reviewRating(String name);
	public List<ReviewVO> reviewPaging(ReviewVO vo);
	public ReviewVO getReviewWriter(ReviewVO vo);
	public void reviewDelete(ReviewVO vo);
	boolean canReviewRegCheckDate(ReviewVO vo);
	boolean canReviewRegCheckExist(ReviewVO vo);
	public void reviewUpdate(ReviewVO vo);
	ReviewVO getHistoryForModify(ReviewVO vo);
	ReviewVO getHistoryForInsert(ReviewVO vo);
	void reviewInsert(ReviewVO vo);
	void reviewPoint(String id);
	String getDesName(String id);
}
