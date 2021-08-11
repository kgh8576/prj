package com.one.style.mem.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.mem.mapper.MemMapper;
import com.one.style.mem.service.MemService;
import com.one.style.mem.vo.MemberVO;

@Repository("memDao")
public class MemServiceImpl implements MemService {

	@Autowired
	MemMapper memMapper;
	
	
	@Override
	public List<MemberVO> memList() {
		return memMapper.memList();
	}

// 맴버 로그인체크
	@Override
	public boolean loginCheck(MemberVO vo) {
		boolean N = false;
		MemberVO mvo = memMapper.loginCheck(vo);
		
		if(mvo != null) {
			N = true;
		} else {
			N = false;
		}
			
		return N;
	}

// 맴버로그인 값 받아오기
	@Override
	public MemberVO login(MemberVO vo) {
		// TODO Auto-generated method stub
		return memMapper.login(vo);
	}
	//회원가입 아이디 중복확인
	public boolean insertcheck(MemberVO vo)  {
		boolean N = false;
		MemberVO mvo = memMapper.insertCheck(vo);
		System.out.println("mvo 결과 "  + mvo);
		
		if(mvo != null) {
			N = true;
		} else {
			N = false;
		}
		System.out.println("불린타입 "+N);
		return N;
	}

// 회원가입
	@Override
	public void memberInsert(MemberVO vo) {
		memMapper.memberInsert(vo);
	}

// 회원수정
	@Override
	public MemberVO memberUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

//회원탈퇴
	@Override
	public MemberVO memberDelete(MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	
//회원ID찾기
	@Override
	public String getUserIdByHpName(Map<String, String> map) {
		List<MemberVO> list = memMapper.getUserIdByHpName(map);
		return list.get(0).getId();
	}

	@Override
	public int updateUserPwByHpName(Map<String, String> map) {
		return memMapper.updateUserPwByHpName(map);
	}

	@Override
	public boolean checkSchedule(ConHistoryVO vo) {
		boolean YorN = false;
		
		ConHistoryVO cvo = memMapper.checkSchedule(vo);
		
		if (cvo != null) {
			YorN = true;
		} else {
			YorN = false;
		}
		
		return YorN;
	}

}
