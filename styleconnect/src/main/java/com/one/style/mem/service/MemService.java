package com.one.style.mem.service;

import java.util.List;

import com.one.style.mem.vo.MemberVO;

public interface MemService {
	
	public List<MemberVO> memList();
	public boolean loginCheck(MemberVO vo);
	public MemberVO login(MemberVO vo);
	public MemberVO memberInsert(MemberVO vo);
	public MemberVO memberUpdate(MemberVO vo);
	public MemberVO memberDelete(MemberVO vo);
	public boolean insertcheck(MemberVO vo);
	
}
