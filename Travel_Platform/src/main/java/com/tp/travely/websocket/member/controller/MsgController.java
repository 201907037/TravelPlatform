package com.tp.travely.websocket.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.tp.travely.websocket.msg.model.service.MsgService;

@Controller
public class MsgController {

	@Autowired
	private MsgService msgService;
	
	// 채팅방으로 포워딩
	@GetMapping("msgPage.mg")
	public String MsgPageView() {
		
		return "webSoket/webSoket";
	}
	
	
}
