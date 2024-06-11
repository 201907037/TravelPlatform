// 유진 - tour 패키지 생성 (2024.06.10)
package com.tp.travely.tour.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.tp.travely.tour.model.service.TourService;
import com.tp.travely.tour.model.vo.City;
import com.tp.travely.tour.model.vo.Tour;

@Controller
public class TourController {
	
	@Autowired
	private TourService tourService;
	
	// 유진 - 2024.06.10
	// 관리자 여행지 목록 조회 컨트롤러
	@GetMapping("adminTour.ad")
	public String adminTourListView(Model model) {
		
		// 게시글 목록 조회
		ArrayList<Tour> list = tourService.adminTourList();
		
		// 응답데이터 담기
		model.addAttribute("tList", list);
		
		// 응답페이지 포워딩
		return "admin/adminTourListView";
	}
	
	// 유진 - 2024.06.10
	// 관리자 여행지 추가 (페이지로 이동하는) 컨트롤러
	@GetMapping("adminTourEnroll.ad")
	public String adminTourEnrollForm(Model model) {
		// 응답페이지 포워딩
		return "admin/adminTourEnrollForm";
	}
	
	// 유진 - 2024.06.11
	// 관리자 여행지 추가 컨트롤러 (INSERT)
	@PostMapping("adminTourInsert.ad")
	public void adminTourInsert() {
		
	}
	
	// 김동현 - 2024.06.11
	// 여행지 조회 메소드(SELECT)
	@GetMapping(value="cityList.to", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String selectCity(int areaCode) {
		
		ArrayList<City> list =  tourService.selectCity(areaCode);
//		for(City c : list) {
//			System.out.println(c);
//		}
		return new Gson().toJson(list);
	}
}
