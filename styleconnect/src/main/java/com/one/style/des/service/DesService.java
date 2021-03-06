package com.one.style.des.service;

import java.util.List;

import com.one.style.des.vo.DesVO;


public interface DesService {

	
	public DesVO selectDes(DesVO vo);
	public List<DesVO> designerList();
	public boolean designerloginCheck(DesVO vo);
	public DesVO designerlogin(DesVO vo);
	public void designerInsert(DesVO vo);
	public DesVO designerUpdate(DesVO vo);
	public DesVO designerDelete(DesVO vo);
	public int designerinsertcheck(DesVO vo);

}
