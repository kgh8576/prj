package com.one.style.desmypage.service;

import java.util.List;

import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.des.vo.DesVO;

public interface DesMypageService {

	//디자이너 마이페이지
	public int desUpdate(DesVO vo);
	public int desFileUpdate(DesVO vo);
	public int desmajorUpdate(DesVO vo);
	public DesVO selectDesPro(DesVO vo);
	public DesVO selectDesCer(DesVO vo);
	public List<DesVO> selectDesThum();
	public void pwchange(DesVO vo);
	//상담등록
	public void desCourseInsert(DesVO vo);
	public int desCourseUpdate(DesVO vo);
	
	public List<DesVO> desCourseList(DesVO vo);
	public DesVO desCourseSelect(DesVO vo);
	public DesVO desCourSeq();
	
	//상담내역관리
	public List<DesVO> desScheList(ConHistoryVO vo);
}
