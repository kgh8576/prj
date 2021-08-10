package com.one.style.desmypage.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.conhistory.vo.ConHistoryVO;
import com.one.style.des.vo.DesVO;
import com.one.style.desmypage.mapper.DesMypageMapper;
import com.one.style.desmypage.service.DesMypageService;

@Repository("desMyDao")
public class DesMypageServiceImpl implements DesMypageService {

	@Autowired
	DesMypageMapper desMapper;
	
	@Override
	public int desUpdate(DesVO vo) {
		// 디자이너 기본 정보수정
		return desMapper.desUpdate(vo);
	}
	@Override
	public DesVO selectDesPro(DesVO vo) {
		// 디자이너 프로필 사진
		return desMapper.selectDesPro(vo);
	}
	@Override
	public int desFileUpdate(DesVO vo) {
		// 디자이너 파일 수정
		return desMapper.desFileUpdate(vo);
	}
	@Override
	public int desmajorUpdate(DesVO vo) {
		// 디자이너 전문분야 수정
		return desMapper.desmajorUpdate(vo);
	}
	@Override
	public DesVO selectDesCer(DesVO vo) {
		// 디자이너 증명서 
		return desMapper.selectDesCer(vo);
	}
	@Override
	public void pwchange(DesVO vo) {
		// 비밀번호 변경
		desMapper.pwchange(vo);
	}
	@Override
	public void desCourseInsert(DesVO vo) {
		//상담등록
		desMapper.desCourseInsert(vo);
	}
	@Override
	public int desCourseUpdate(DesVO vo) {
		//상담 수정
		return desMapper.desCourseUpdate(vo);
	}
	@Override
	public DesVO desCourseSelect(DesVO vo) {
		// 상담선택
		return desMapper.desCourseSelect(vo);
	}
	@Override
	public List<DesVO> selectDesThum() {
		// TODO Auto-generated method stub
		return desMapper.selectDesThum();
	}
	@Override
	public List<DesVO> desCourseList(DesVO vo) {
		// TODO Auto-generated method stub
		return desMapper.desCourseList(vo);
	}
	@Override
	public DesVO desCourSeq() {
		// TODO Auto-generated method stub
		return desMapper.desCourSeq();
	}
	@Override
	public List<DesVO> desScheList(ConHistoryVO vo) {
		// 
		return desMapper.desScheList(vo);
	}
	@Override
	public int desApprove(ConHistoryVO vo) {
		// TODO Auto-generated method stub
		return desMapper.desApprove(vo);
	}
	@Override
	public int desDeny(ConHistoryVO vo) {
		// TODO Auto-generated method stub
		return desMapper.desDeny(vo);
	}
	@Override
	public List<DesVO> selectDesSty(DesVO vo) {
		// TODO Auto-generated method stub
		return desMapper.selectDesSty(vo);
	}

}
