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
	public int desUpdate(DesVO vo) {
		// 정보수정
		return desMapper.desUpdate(vo);
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
	@Override
	public DesVO selectDes(DesVO vo) {
		// 디자이너 한명 선택
		return desMapper.selectDes(vo);
	}
	@Override
	public boolean pwCheck(DesVO vo) {
		boolean N = false;
		DesVO dvo = desMapper.pwCheck(vo);
		System.out.println("dvo ::::" + dvo);
		
		if(dvo != null) {
			N = true;
		}else {
			N = false;
		}
		System.out.println("boolean====" + N);
		return N;
	}

}
