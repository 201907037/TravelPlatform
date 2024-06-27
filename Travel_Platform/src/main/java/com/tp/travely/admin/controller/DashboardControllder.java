package com.tp.travely.admin.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.tp.travely.admin.service.AdminService;
import com.tp.travely.admin.service.GenderCount;

@Controller
public class DashboardControllder {
	
	@Autowired
	private AdminService adminService;
	
	// 남자 여자 성별 대시보드
	@GetMapping(value="dashBoard.ad")
	public String dashBoardList(Model model) {
		
		// 성별 대시보드
		ArrayList<GenderCount> result = adminService.genderCount();
		
		model.addAttribute("F", result.get(0).getCount());
		model.addAttribute("M", result.get(1).getCount());
		
		// 테마 대시보드
		ArrayList<Map> typeCount = adminService.tourTypeCount();

		model.addAttribute("typeCount", typeCount.get(0).values());
		
		// 날짜별 게시글 업로드 수
		ArrayList<Map> uploadCount = adminService.uploadCount();
		ArrayList<String> createList = new ArrayList<>();
		ArrayList<BigDecimal> countList = new ArrayList<>();
		for(int i=0; i < uploadCount.size(); i++) {
			
			createList.add("'"+uploadCount.get(i).get("CREATE").toString().substring(0, 10)+"'");
			countList.add((BigDecimal) uploadCount.get(i).get("COUNT"));
		}
		model.addAttribute("createList", createList);
		model.addAttribute("countList", countList);
		
		return "dashBoard/dashBoard";
	}
	
	
	
	
}
