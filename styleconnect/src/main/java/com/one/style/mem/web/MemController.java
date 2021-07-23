package com.one.style.mem.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.one.style.mem.service.MemService;

@Controller
public class MemController {
	
	@Autowired
	MemService memberDao;
	
	
	
}
