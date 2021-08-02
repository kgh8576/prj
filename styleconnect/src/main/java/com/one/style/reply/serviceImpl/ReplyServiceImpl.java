package com.one.style.reply.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.des.vo.DesVO;
import com.one.style.mem.mapper.MemMapper;
import com.one.style.mem.service.MemService;
import com.one.style.mem.vo.MemberVO;
import com.one.style.reply.mapper.ReplyServiceMap;
import com.one.style.reply.service.ReplyService;
import com.one.style.reply.vo.ReplyVO;
import com.one.style.review.vo.ReviewVO;

@Repository("replyDao")
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyServiceMap map;

	@Override
	public void insertReply(ReplyVO vo) {
		map.insertReply(vo);
	}
	
	@Override
	public void updateReply(ReplyVO vo) {
		map.updateReply(vo);
	}

	@Override
	public ReplyVO getReply(ReviewVO vo) {
		return map.getReply(vo);
	}

	@Override
	public DesVO canReplyCheck(ReviewVO vo) {
		return map.canReplyCheck(vo);
	}
	

}
