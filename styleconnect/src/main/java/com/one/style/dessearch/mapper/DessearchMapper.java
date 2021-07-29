package com.one.style.dessearch.mapper;

import java.util.List;

import com.one.style.dessearch.vo.DessearchVO;

public interface DessearchMapper {
	
		List<DessearchVO> dessearchSelectList();
		DessearchVO dessearchSelect(String id);
		List<DessearchVO> cutList();
		List<DessearchVO> permList();
		List<DessearchVO> dyeList();
		List<DessearchVO> makeupList();
}