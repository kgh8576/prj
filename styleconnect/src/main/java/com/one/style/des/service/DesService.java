package com.one.style.des.service;

import java.util.List;

import com.one.style.des.vo.DesVO;


public interface DesService {

	
	public List<DesVO> designerList();
	public boolean designerloginCheck(DesVO vo);
	public DesVO designerlogin(DesVO vo);
	public void designerInsert(DesVO vo);
	public DesVO designerUpdate(DesVO vo);
	public DesVO designerDelete(DesVO vo);
	public boolean designerinsertcheck(DesVO vo);
	//디자이너 마이페이지
	public int desUpdate(DesVO vo);
	public DesVO selectDes(DesVO vo);
	public boolean pwCheck(DesVO vo);
}
