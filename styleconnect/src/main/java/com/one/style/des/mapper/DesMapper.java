package com.one.style.des.mapper;

import java.util.List;

import com.one.style.des.vo.DesVO;

public interface DesMapper {

	public List<DesVO> memList();
	public DesVO dloginCheck(DesVO vo);
	public DesVO dlogin(DesVO vo);
	public void memberInsert(DesVO vo);
	public int desUpdate(DesVO vo);
	public DesVO memberDelete(DesVO vo);
	public boolean insertcheck(DesVO vo);
	
	
	public DesVO selectDes(DesVO vo);
	public DesVO  pwCheck(DesVO vo);
}
