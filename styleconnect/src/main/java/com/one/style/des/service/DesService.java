package com.one.style.des.service;

import java.util.List;

import com.one.style.des.vo.DesVO;


public interface DesService {

	public List<DesVO> memList();
	public boolean loginCheck(DesVO vo);
	public DesVO login(DesVO vo);
	public void memberInsert(DesVO vo);
	public DesVO memberUpdate(DesVO vo);
	public DesVO memberDelete(DesVO vo);
	public boolean insertcheck(DesVO vo);
	
}
