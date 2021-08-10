package com.one.style.review.mapper;

import java.util.List;

import com.one.style.review.vo.ReviewVO;

public interface ReviewServiceMap {
	public ReviewVO reviewPersonalTotal(String name);
	public int reviewRating(String name);
	public List<ReviewVO> reviewPaging(ReviewVO vo);
	public ReviewVO getReviewWriter(ReviewVO vo);
	public void reviewDelete(ReviewVO vo);
	ReviewVO canReviewRegCheckDate(ReviewVO vo);
	ReviewVO canReviewRegCheckExist(ReviewVO vo);
	public void reviewUpdate(ReviewVO vo);
	ReviewVO getHistoryForModify(ReviewVO vo);
	ReviewVO getHistoryForInsert(ReviewVO vo);
	void reviewInsert(ReviewVO vo);
	void reviewPoint(String id);
	String getDesName(String id);
	
}
