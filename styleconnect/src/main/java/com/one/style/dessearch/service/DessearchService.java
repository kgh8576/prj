package com.one.style.dessearch.service;

import java.util.List;

import com.one.style.dessearch.vo.DessearchVO;

public interface DessearchService {
	//전체디자이너 리스트
	List<DessearchVO> dessearchSelectList();
	//디자이너 한명
	DessearchVO dessearchSelect(String id);
	//컷,펌,염색,메이크업 리스트
	List<DessearchVO> cutList();
	List<DessearchVO> permList();
	List<DessearchVO> dyeList();
	List<DessearchVO> makeupList();
	
}
