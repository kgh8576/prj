package com.one.style.reply.mapper;

import com.one.style.des.vo.DesVO;
import com.one.style.reply.vo.ReplyVO;
import com.one.style.review.vo.ReviewVO;

public interface ReplyServiceMap {
	void insertReply(ReplyVO vo);
	void updateReply(ReplyVO vo);
	ReplyVO getReply(ReviewVO vo);
	DesVO canReplyCheck(ReviewVO vo);
	
}
