package com.one.style.dessearch.mapper;

import java.util.List;

import com.one.style.dessearch.vo.DessearchVO;

public interface DessearchMapper {
	
	public List<DessearchVO> dessearchSelectList();
	public DessearchVO dessearchSelect(DessearchVO vo);
	public List<DessearchVO> dessearchSelectReview(DessearchVO vo);
	public List<DessearchVO> cutList();
	public List<DessearchVO> permList();
	public List<DessearchVO> dyeList();
	public List<DessearchVO> makeupList();
	public List<DessearchVO> courseList();
	public List<DessearchVO> searchList(DessearchVO vo);
	 int permCnt();
	public List<DessearchVO> desPaging();
	public List<DessearchVO> desProImg(DessearchVO vo);
	public List<DessearchVO> dessearchDesThum(DessearchVO vo);
}
