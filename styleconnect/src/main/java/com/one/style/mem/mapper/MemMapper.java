package com.one.style.mem.mapper;

import java.util.List;
import java.util.Map;

import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.mem.vo.MemberVO;

public interface MemMapper {
	public List<MemberVO> memList();
	public MemberVO loginCheck(MemberVO vo);
	public MemberVO login(MemberVO vo);
	public void memberInsert(MemberVO vo);
	public void memberUpdate(MemberVO vo);
	public MemberVO memberDelete(MemberVO vo);
	public int insertCheck(MemberVO vo);
	public List<MemberVO> getUserIdByHpName(Map<String, String> map);
	public int updateUserPwByHpName(Map<String, String> map);
	public ConHistoryVO checkSchedule(ConHistoryVO vo);
	public MemberVO checkExistUserByIdHp(Map<String, String> map);
	public ConHistoryVO startSchedule(ConHistoryVO vo);
	
}
