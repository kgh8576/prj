package com.one.style.admin.service;

import java.util.List;

import com.one.style.des.vo.DesVO;
import com.one.style.mem.vo.MemberVO;

public interface AdminService {
	public List<MemberVO> memberListSelect();
	public List<DesVO> designerListSelect();
}
