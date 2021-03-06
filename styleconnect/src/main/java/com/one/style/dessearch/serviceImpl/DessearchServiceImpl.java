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
	public List<DessearchVO> dessearchList() {
		// 전체디자이너 리스트
		return sqlSession.selectList("dessearchList");
	}

	@Override
	public DessearchVO dessearchSelect(DessearchVO vo) {
		// 디자이너 한명 조회
		return sqlSession.selectOne("dessearchSelect", vo);
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

	@Override
	public List<DessearchVO> courseList(DessearchVO vo) {
		// 상담목록 리스트
		return sqlSession.selectList("courseList" , vo.getId());
	}

	@Override
	public List<DessearchVO> searchList(DessearchVO vo) {
		// 검색
		return sqlSession.selectList("searchList",vo);
	}

	@Override
	public List<DessearchVO> dessearchSelectReview(DessearchVO vo) {
		// 리뷰
		return sqlSession.selectList("dessearchSelectReview", vo);
	}

	@Override
	public List<DessearchVO> desProImg(DessearchVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("desProImg", vo);
	}

	@Override
	public List<DessearchVO> dessearchDesThum(DessearchVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("dessearchDesThum",vo);
	}

	@Override
	public List<DessearchVO> dessearchDesSty(DessearchVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("dessearchDesSty",vo);
	}

	@Override
	public DessearchVO desProfileImg(DessearchVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("desProfileImg",vo);
	}
}
