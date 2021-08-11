package com.one.style.dessearch.service;

import java.util.List;

import com.one.style.dessearch.vo.DessearchVO;

public interface DessearchService {
	//전체디자이너 리스트  
	List<DessearchVO> dessearchSelectList();
	//디자이너 한명
	DessearchVO dessearchSelect(DessearchVO vo);
	List<DessearchVO> dessearchSelectReview(DessearchVO vo);
	//컷,펌,염색,메이크업 리스트
	List<DessearchVO> cutList();
	List<DessearchVO> permList();
	List<DessearchVO> dyeList();
	List<DessearchVO> makeupList();
	//상담목록
	List<DessearchVO> courseList(DessearchVO vo);
	
	//검색
	List<DessearchVO> searchList(DessearchVO vo);
	
	//페이징
	int permCnt();
	//디자이너 프로필 이미지
	List<DessearchVO> desProImg(DessearchVO vo);
	public List<DessearchVO> dessearchDesThum(DessearchVO vo);
	
}
