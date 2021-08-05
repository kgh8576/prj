package com.one.style.dessearch.mapper;

import java.util.List;

import com.one.style.dessearch.vo.DessearchVO;

public interface DessearchMapper {
	
		List<DessearchVO> dessearchSelectList();
		DessearchVO dessearchSelect(DessearchVO vo);
		List<DessearchVO> dessearchSelectReview(DessearchVO vo);
		List<DessearchVO> cutList();
		List<DessearchVO> permList();
		List<DessearchVO> dyeList();
		List<DessearchVO> makeupList();
		List<DessearchVO> courseList();
		List<DessearchVO> searchList(DessearchVO vo);
		int permCnt();
		List<DessearchVO> desPaging();
		List<DessearchVO> desProImg(DessearchVO vo);
}
