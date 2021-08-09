package com.one.style.desmypage.mapper;

import java.util.List;

import com.one.style.des.vo.DesVO;

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
	//상담등록
	public void desCourseInsert(DesVO vo);
	public int desCourseUpdate(DesVO vo);
	
	public List<DesVO> desCourseList(DesVO vo);
	public DesVO desCourseSelect(DesVO vo);
	public DesVO desCourSeq();
}
