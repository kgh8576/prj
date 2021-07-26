package com.one.style.dessearch.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.dessearch.service.DessearchService;
import com.one.style.dessearch.vo.DessearchVO;
@Repository
public class DessearchServiceImpl implements DessearchService {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<DessearchVO> selectDessearchList() {
		// 전체디자이너 리스트
		return sqlSession.selectList("selectDessearchList");
	}

	@Override
	public DessearchVO selectDessearch(DessearchVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DessearchVO> cutList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cutList");
	}

	@Override
	public List<DessearchVO> permList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DessearchVO> dyeList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DessearchVO> makeupList() {
		// TODO Auto-generated method stub
		return null;
	}

	

}
