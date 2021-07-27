package com.one.style.mem.mapper;

import java.util.List;

import com.one.style.mem.vo.MemberVO;

public interface MemMapper {
	public List<MemberVO> memList();
	public MemberVO loginCheck(MemberVO vo);
	public MemberVO login(MemberVO vo);
	public void memberInsert(MemberVO vo);
	public MemberVO memberUpdate(MemberVO vo);
	public MemberVO memberDelete(MemberVO vo);
	public MemberVO insertCheck(MemberVO vo);
	
}
