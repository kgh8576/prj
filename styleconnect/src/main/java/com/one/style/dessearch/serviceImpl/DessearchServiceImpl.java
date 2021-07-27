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
	public List<DessearchVO> dessearchSelectList() {
		// 전체디자이너 리스트
		return sqlSession.selectList("dessearchSelectList");
	}

	@Override
	public DessearchVO dessearchSelect(String id) {
		// 디자이너 한명 조회
		return sqlSession.selectOne("dessearchSelect",id);
	}

	@Override
	public List<DessearchVO> cutList() {
		// 컷전문
		return sqlSession.selectList("cutList");
	}

	@Override
	public List<DessearchVO> permList() {
		// 펌전문
		return sqlSession.selectList("permList");
	}

	@Override
	public List<DessearchVO> dyeList() {
		// 염색전문
		return sqlSession.selectList("dyeList");
	}

	@Override
	public List<DessearchVO> makeupList() {
		// 메이크업전문
		return sqlSession.selectList("makeupList");
	}


	

}
