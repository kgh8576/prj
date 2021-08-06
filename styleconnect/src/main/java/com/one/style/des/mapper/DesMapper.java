package com.one.style.des.mapper;

import java.util.List;

import com.one.style.des.vo.DesVO;

public interface DesMapper {


	
	public List<DesVO> designerList();
	public DesVO designerloginCheck(DesVO vo);
	public DesVO designerlogin(DesVO vo);
	public void designerInsert(DesVO vo);
	public DesVO designerUpdate(DesVO vo);
	public DesVO designerDelete(DesVO vo);
	public DesVO designerinsertcheck(DesVO vo);
	//디자이너 마이페이지
	public int desUpdate(DesVO vo);
	public DesVO selectDes(DesVO vo);
	public DesVO pwCheck(DesVO vo);
	public DesVO selectDesPro(DesVO vo);
	public int desProUpdate(DesVO vo);
	public int desmajorUpdate(DesVO vo);
}
