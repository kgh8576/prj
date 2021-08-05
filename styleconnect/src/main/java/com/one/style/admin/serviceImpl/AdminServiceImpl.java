package com.one.style.admin.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.style.admin.mapper.AdminMapper;
import com.one.style.admin.service.AdminService;
import com.one.style.des.vo.DesVO;
import com.one.style.mem.vo.MemberVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	AdminMapper adminMapper;	
	
	public List<MemberVO> memberListSelect(){
		return adminMapper.memberListSelect();	
	}
	public List<DesVO> designerListSelect(){
		return null;
		
	}
}
