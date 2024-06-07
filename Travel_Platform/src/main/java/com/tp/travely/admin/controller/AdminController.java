package com.tp.travely.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.tp.travely.admin.service.AdminService;
import com.tp.travely.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 관리자 메인페이지 이동
	@GetMapping("adminPage.ad")
	public String adminPageView() {
		
		return "admin/adminPage";
	}
	
	// 관리자 회원 목록페이지
	@GetMapping("adminMember.ad")
	public String adminMemberListView(Model model) {
		
		
		ArrayList<Member> list = adminService.adminMemberList();
		
		/*
		 * for(Member m : list) { System.out.println(m); }
		 */
		
		model.addAttribute("mList", list);
		
		return "admin/adminMemberListView";
	}

	
	
}
