package com.one.style.admin.mapper;

import java.util.List;

import com.one.style.des.vo.DesVO;
import com.one.style.mem.vo.MemberVO;

public interface AdminMapper {
	
	public List<MemberVO> memberListSelect();
	public List<DesVO> designerListSelect();
}
