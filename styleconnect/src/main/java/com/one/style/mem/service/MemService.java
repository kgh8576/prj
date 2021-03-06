package com.one.style.mem.service;

import java.util.List;
import java.util.Map;

import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.mem.vo.MemberVO;

public interface MemService {
	
	public List<MemberVO> memList();
	public boolean loginCheck(MemberVO vo);
	public MemberVO login(MemberVO vo);
	public void memberInsert(MemberVO vo);
	public MemberVO memberUpdate(MemberVO vo);
	public MemberVO memberDelete(MemberVO vo);
	public int insertcheck(MemberVO vo);
	public List<MemberVO> getUserIdByHpName(Map<String, String> map);
	public int updateUserPwByHpName(Map<String, String> map);
	public boolean checkSchedule(ConHistoryVO vo);
	public boolean startSchedule(ConHistoryVO vo);
	public boolean checkExistUserByIdHp(Map<String, String> map);
}
