package com.one.style.admin.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.style.admin.mapper.AdminMapper;
import com.one.style.admin.service.AdminService;
import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.des.vo.DesVO;
import com.one.style.files.vo.FilesVO;
import com.one.style.mem.vo.MemberVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	AdminMapper adminMapper;	
	
	public List<MemberVO> memberListSelect(MemberVO vo){
		return adminMapper.memberListSelect(vo);	
	}
	
	@Override
	public int memberListTotalCountSelect(MemberVO vo) {
		return adminMapper.memberListTotalCountSelect(vo);
	}
	
	@Override
	public List<ConHistoryVO> memberConHistoryListSelect(ConHistoryVO vo) {
		return adminMapper.memberConHistoryListSelect(vo);
	}
	
	@Override
	public int memberConHistoryListTotalCountSelect(ConHistoryVO vo) {
		return adminMapper.memberConHistoryListTotalCountSelect(vo);
	}
	
	@Override
	public int memberConHistoryUpdate(ConHistoryVO vo) {
		return adminMapper.memberConHistoryUpdate(vo);
	}
	
	public List<DesVO> designerListSelect(DesVO vo){
		return adminMapper.designerListSelect(vo);
	}
	
	@Override
	public int designerListTotalCountSelect(DesVO vo) {
		return adminMapper.designerListTotalCountSelect(vo);
	}

	@Override
	public List<ConHistoryVO> designerConHistoryListSelect(ConHistoryVO vo) {
		return adminMapper.designerConHistoryListSelect(vo);
	}

	@Override
	public int designerConHistoryListTotalCountSelect(ConHistoryVO vo) {
		return adminMapper.designerConHistoryListTotalCountSelect(vo);
	}

	@Override
	public int designerConHistoryUpdate(ConHistoryVO vo) {
		return adminMapper.designerConHistoryUpdate(vo);
	}

	@Override
	public DesVO designerStateOneSelect(DesVO vo) {
		return adminMapper.designerStateOneSelect(vo);
	}

	@Override
	public List<FilesVO> designerCertificationFileListSelect(FilesVO vo) {
		return adminMapper.designerCertificationFileListSelect(vo);
	}

	@Override
	public int designerStateUpdate(DesVO vo) {
		return adminMapper.designerStateUpdate(vo);
	}


}
