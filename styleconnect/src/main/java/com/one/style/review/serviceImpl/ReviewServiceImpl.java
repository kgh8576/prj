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
	public void reviewUpdate(ReviewVO vo) {
		map.reviewUpdate(vo);
	}

	@Override
	public ReviewVO getHistoryForModify(ReviewVO vo) {
		return map.getHistoryForModify(vo);
	}

	@Override
	public ReviewVO getHistoryForInsert(ReviewVO vo) {
		return map.getHistoryForInsert(vo);
	}

	@Override
	public void reviewInsert(ReviewVO vo) {
		map.reviewInsert(vo);
		
	}

	@Override
	public void reviewPoint(String id) {
		map.reviewPoint(id);
	}

	@Override
	public boolean canReviewRegCheckDate(ReviewVO vo) {
		boolean b = false;
		if(map.canReviewRegCheckDate(vo) != null) {
			b = true;
			return b;
		}
		return b;
	}

	@Override
	public boolean canReviewRegCheckExist(ReviewVO vo) {
		boolean b = false;
		if(map.canReviewRegCheckExist(vo) == null) {
			b = true;
			return b;
		}
		return b;
	}

	@Override
	public String getDesName(String id) {
		return map.getDesName(id);
	}
	
	
	
}
