package com.one.style.des.mapper;

import java.util.List;

import com.one.style.des.vo.DesVO;

public interface DesMapper {

	public List<DesVO> designerList();
	public DesVO designerloginCheck(DesVO vo);
	public DesVO designerlogin(DesVO vo);
	public void designerInsert(DesVO vo);
	public DesVO designerUpdate(DesVO vo);
	public DesVO designerDelete(DesVO vo);
	public DesVO designerinsertcheck(DesVO vo);
	
}
