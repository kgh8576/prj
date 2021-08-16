package com.one.style.admin.service;

import java.util.List;

import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.des.vo.DesVO;
import com.one.style.files.vo.FilesVO;
import com.one.style.mem.vo.MemberVO;

public interface AdminService {
	//일반회원 관리
	public List<MemberVO> memberListSelect(MemberVO vo);
	public int memberListTotalCountSelect(MemberVO vo);
	public List<ConHistoryVO> memberConHistoryListSelect(ConHistoryVO vo);
	public int memberConHistoryListTotalCountSelect(ConHistoryVO vo);
	public int memberConHistoryUpdate(ConHistoryVO vo);
	
	//디자이너 관리
	public List<DesVO> designerListSelect(DesVO vo);
	public int designerListTotalCountSelect(DesVO vo);
	public List<ConHistoryVO> designerConHistoryListSelect(ConHistoryVO vo);
	public int designerConHistoryListTotalCountSelect(ConHistoryVO vo); 
	public int designerConHistoryUpdate(ConHistoryVO vo);
	public DesVO designerStateOneSelect(DesVO vo);
	public List<FilesVO> designerCertificationFileListSelect(FilesVO vo);
	public int designerStateUpdate(DesVO vo);
	

}
