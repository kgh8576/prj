package com.one.style.reply.service;

import com.one.style.des.vo.DesVO;
import com.one.style.reply.vo.ReplyVO;
import com.one.style.review.vo.ReviewVO;

public interface ReplyService {
	void insertReply(ReplyVO vo);
	ReplyVO getReply(ReviewVO vo);
	DesVO canReplyCheck(ReviewVO vo);
}
