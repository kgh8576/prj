package com.one.style.reply.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.style.mem.service.MemService;
import com.one.style.reply.service.ReplyService;
import com.one.style.review.vo.ReviewVO;

@Controller
public class ReplyController {

	@Autowired
	ReplyService replyDao;

	@RequestMapping("replyRegister.do")
	public String replyRegister(ReviewVO vo) {
		return "review/reviewRegister";
	}

	@RequestMapping("replyInsert.do")
	@ResponseBody
	public String replyInsert(ReviewVO vo) {
		return null;
	}

	
}
