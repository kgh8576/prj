package com.one.style.des.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.des.mapper.DesMapper;
import com.one.style.des.service.DesService;
import com.one.style.des.vo.DesVO;

@Repository("desDao")
public class DesServiceImpl implements DesService {

	@Autowired
	DesMapper desMapper;
	
	@Override
	public List<DesVO> designerList() {
		// TODO Auto-generated method stub
		return null;
	}
//디자이너 로그인
	@Override
	public boolean designerloginCheck(DesVO vo) {
		boolean N = false;
		DesVO dvo = desMapper.designerloginCheck(vo);
		
		if(dvo != null) {
			N = true;
		}else {
			N = false;
		}
		
		return N;
	}

	@Override
	public DesVO designerlogin(DesVO vo) {
		// TODO Auto-generated method stub
		return desMapper.designerlogin(vo);
	}

	@Override
	public void designerInsert(DesVO vo) {
		
		desMapper.designerInsert(vo);
	}

	@Override
	public DesVO designerUpdate(DesVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DesVO designerDelete(DesVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean designerinsertcheck(DesVO vo) {
		boolean N = false;
		DesVO dvo = desMapper.designerinsertcheck(vo);
		
		if(dvo != null) {
			N = true;
		} else {
			N = false;
		}
		
		return N;
	}

}
