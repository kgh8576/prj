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
	public List<DesVO> memList() {
		// TODO Auto-generated method stub
		return null;
	}
//디자이너 로그인
	@Override
	public boolean loginCheck(DesVO vo) {
		boolean N = false;
		DesVO dvo = desMapper.dloginCheck(vo);
		
		if(dvo != null) {
			N = true;
		}else {
			N = false;
		}
		
		return N;
	}

	@Override
	public DesVO login(DesVO vo) {
		// TODO Auto-generated method stub
		return desMapper.dlogin(vo);
	}

	@Override
	public void memberInsert(DesVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public DesVO memberUpdate(DesVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DesVO memberDelete(DesVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insertcheck(DesVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

}
