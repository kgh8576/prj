package com.one.style.payment.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.style.payment.mapper.PaymentMapper;
import com.one.style.payment.service.PaymentService;
import com.one.style.payment.vo.PaymentVO;

@Repository("PaymentDao")
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	PaymentMapper paymentMapper;
	
	@Override
	public int paymentInsert(PaymentVO vo) {
		paymentMapper.paymentInsert(vo);
		return 0;
	}

}
