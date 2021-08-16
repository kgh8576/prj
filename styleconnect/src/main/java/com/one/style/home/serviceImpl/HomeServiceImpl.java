package com.one.style.home.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.crawldata.vo.CrawlDataVO;
import com.one.style.home.mapper.HomeServiceMap;
import com.one.style.home.service.HomeService;
import com.one.style.home.vo.HomeVO;
import com.one.style.mem.vo.MemDetailVO;

@Repository("homeDao")
public class HomeServiceImpl implements HomeService{

	@Autowired HomeServiceMap map;

	@Override
	public List<HomeVO> ajaxTopDesInfo(String keyword) {
		return map.ajaxTopDesInfo(keyword);
	}

	@Override
	public MemDetailVO memDetail(String id) {
		return map.memDetail(id);
	}

	//메인페이지 추천 디자이너 별점 수 기준
	@Override
	public HomeVO rcmdDesByRate(MemDetailVO vo) {
		return map.rcmdDesByRate(vo);
	}

	//메인페이지 추천 디자이너 내역 수 기준
	@Override
	public HomeVO rcmdDesByConHis(MemDetailVO vo) {
		return map.rcmdDesByConHis(vo);
	}

	@Override
	public void memDetailInsert(MemDetailVO vo) {
		map.memDetailInsert(vo);
	}

	@Override
	public Map<String, String> searchKeywordsList() {
//		List<HomeVO> list = map.searchKeywordsList();
//		String[] sliced;
//		Map<HomeVO, String> map;
//		for(int i = 0; i < list.size(); i++) {
//			if ( list.get(i).getCategory().equals("major") ){
//				sliced = list.get(i).getKeyword().split(",");
//				for (int j = 0; j < sliced.length; j++) {
//					HomeVO vo = new HomeVO();
//					vo.setCategory("major");
//					vo.setKeyword(sliced[j]);
//					map.put( vo, Integer.toString(map.size()+1));
//				}
//				
//			}
//		}
//
		return null;
	}


	
}
