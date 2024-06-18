package com.tp.travely.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tp.travely.admin.service.AdminService;
import com.tp.travely.board.model.vo.Board;
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
	
	@GetMapping("adminBoardListView.ad")
	public String adminBoardListView(Model model) {
		
		ArrayList<Board> bList = adminService.adminBoardListView();
		
		
		model.addAttribute("bList", bList);
		
		return "admin/adminBoardListView";
	}
	
	
	@ResponseBody
	@GetMapping(value="adminBoardStatus.ad", produces="text/html; charset=UTF-8")
	public String adminBoardStatus(int boardNo, String statusResult) {
		
		// System.out.println(boardNo);
		// System.out.println(statusResult);

		int result = 0;
		String s = "";
		if(statusResult.equals("Y")) {
			// 탈퇴에서 가입으로
			result = adminService.boardSafe(boardNo);
			s = "가입";
		}else {
			// 가입에서 탈퇴로
			result = adminService.boardDelate(boardNo);
			s = "탈퇴";
		}
		return s;
	}
}
