package com.one.style.desmypage.mapper;

import java.util.List;
import java.util.Map;

import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.des.vo.DesVO;
import com.one.style.desmypage.vo.DesMypageVO;

public interface DesMypageMapper {
	//디자이너 마이페이지
	//개인정보수정
	public int desUpdate(DesVO vo);
	public int desFileUpdate(DesVO vo);
	public int desmajorUpdate(DesVO vo);
	public DesVO selectDesPro(DesVO vo);
	public DesVO selectDesCer(DesVO vo);
	public List<DesVO> selectDesThum();
	public void pwchange(DesVO vo);
	public void desexit(DesVO vo);
	
	//상담관리
	public void desCourseInsert(DesVO vo);
	public int desCourseUpdate(DesVO vo);
	public List<DesVO> desCourseList(DesVO vo);
	public DesVO desCourseSelect(DesVO vo);
	public DesVO desCourSeq();
	
	//예약내역관리
	public List<DesVO> desScheList(ConHistoryVO vo);
	public int desApprove(ConHistoryVO vo);
	public int desDeny(ConHistoryVO vo);
	public List<DesVO> selectDesSty(DesVO vo);
	public int desDenyComment(ConHistoryVO vo);
	public String selectCourThum(DesVO vo);
	
	//상담시간 설정 페이지 진입
	public DesMypageVO desWorkOpenPage(String id);
	//상담시간설정 (월화수목금토 Update)
	public int desWorkOpenUpdate(DesMypageVO vo);
	
}
