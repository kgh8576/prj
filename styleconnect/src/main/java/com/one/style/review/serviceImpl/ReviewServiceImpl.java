package com.one.style.review.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.review.mapper.ReviewServiceMap;
import com.one.style.review.service.ReviewService;
import com.one.style.review.vo.ReviewVO;

@Repository("reviewDao")
public class ReviewServiceImpl implements ReviewService{

	@Autowired ReviewServiceMap map;
	
	@Override
	public ReviewVO reviewPersonalTotal(String name) {
		return map.reviewPersonalTotal(name);
	}

	@Override
	public int reviewRating(String name) {
		return map.reviewRating(name);
	}

	@Override
	public List<ReviewVO> reviewPaging(ReviewVO vo) {
		return map.reviewPaging(vo);
	}

	@Override
	public ReviewVO getReviewWriter(ReviewVO vo) {
		return map.getReviewWriter(vo);
	}

	@Override
	public void reviewDelete(ReviewVO vo) {
		map.reviewDelete(vo);
		
	}

	@Override
	public boolean canReviewModCheck(ReviewVO vo) {
		boolean b = false;
		try {
			if (map.canReviewModCheck(vo).getConNo() == vo.getConNo()) {
				b = true;
			}
		} catch(NullPointerException n){} finally {}
		b = true;
		return b;
	}

	@Override
	public boolean canReviewRegCheck(ReviewVO vo) {
		boolean b = false;
		try {
			if (map.canReviewModCheck(vo).getConNo() == vo.getConNo()) {
				if(map.canReviewRegCheck(vo).getConNo() != vo.getConNo()) {
					b = true;
				}
			}
		} catch(NullPointerException n){} finally {}
		return b;
	}

	@Override
	public List<ReviewVO> canRegReviewList(String sessionId) {
		return map.canRegReviewList(sessionId);
	}
	
	

	
}
