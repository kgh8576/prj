package com.one.style.payment.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.style.payment.service.PaymentService;
import com.one.style.payment.vo.PaymentVO;

@Controller
public class PaymentController {

	
	@Autowired
	PaymentService paymentService;
	
	@RequestMapping("paymentInsert.do")
	@ResponseBody
	public void paymentInsert(PaymentVO vo) {
		paymentService.paymentInsert(vo);
	}
	
}
