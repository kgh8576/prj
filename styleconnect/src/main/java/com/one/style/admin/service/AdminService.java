package com.one.style.admin.service;

import java.util.List;

import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.des.vo.DesVO;
import com.one.style.mem.vo.MemberVO;

public interface AdminService {
	//일반회원 관리
	public List<MemberVO> memberListSelect(MemberVO vo);
	public int memberListTotalCountSelect();
	public List<ConHistoryVO> memberConHistoryListSelect(ConHistoryVO vo);
	public int memberConHistoryListTotalCountSelect(ConHistoryVO vo);
	
	//디자이너 관리
	public List<DesVO> designerListSelect(DesVO vo);
	public int designerListTotalCountSelect();
	public List<ConHistoryVO> designerConHistoryListSelect(ConHistoryVO vo);
	public int designerConHistoryListTotalCountSelect(ConHistoryVO vo);
}
