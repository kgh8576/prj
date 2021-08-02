package com.one.style.reply.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.style.reply.service.ReplyService;
import com.one.style.reply.vo.ReplyVO;
import com.one.style.review.vo.ReviewVO;

@Controller
public class ReplyController {

	@Autowired
	ReplyService replyDao;

	@RequestMapping("replyInsert.do")
	@ResponseBody
	public String replyInsert(ReplyVO vo) {
		replyDao.insertReply(vo);
		return null;
	}
	
	@RequestMapping("replyUpdate.do")
	@ResponseBody
	public String replyUpdate(ReplyVO vo) {
		replyDao.updateReply(vo);
		return null;
	}
	
}
