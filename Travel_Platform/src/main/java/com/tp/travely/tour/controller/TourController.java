// 유진 - tour 패키지 생성 (2024.06.10)
package com.tp.travely.tour.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.tp.travely.tour.model.service.TourService;
import com.tp.travely.tour.model.vo.City;
import com.tp.travely.tour.model.vo.Districts;
import com.tp.travely.tour.model.vo.LeportsData;
import com.tp.travely.tour.model.vo.LodgingData;
import com.tp.travely.tour.model.vo.RestaurantData;
import com.tp.travely.tour.model.vo.Tour;
import com.tp.travely.tour.model.vo.TourImg;
import com.tp.travely.tour.model.vo.TourSpotData;

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
	
	// 유진 - 2024.06.11 (실제 작성 - 2024.06.12)
	// 관리자 여행지 추가 컨트롤러 (INSERT)
	@PostMapping("adminTourInsert.ad")
	public ModelAndView adminTourInsert(TourSpotData tsd, LodgingData lod, RestaurantData rd, 
	                                    LeportsData led, TourImg ti, MultipartFile thumbImgFile, 
	                                    ArrayList<MultipartFile> changeNoFiles, 
	                                    HttpSession session, ModelAndView mv) {
	    String thumbImg = savePath(thumbImgFile, session, "thumbImg");
	    List<String> changeNos = savePaths(changeNoFiles, session, "changeNo");
	    ArrayList<TourImg> tourImgList = new ArrayList<>();
	    
	    tsd.setThumbImg("resources/tourUpfiles/" + thumbImg);
	    lod.setThumbImg("resources/tourUpfiles/" + thumbImg);
	    rd.setThumbImg("resources/tourUpfiles/" + thumbImg);
	    led.setThumbImg("resources/tourUpfiles/" + thumbImg);
	    for (String changeNo : changeNos) {
	        TourImg tourImg = new TourImg();
	        tourImg.setChangeNo(changeNo);
	        
	        tourImgList.add(tourImg); // 리스트에 TourImg 객체 추가
	    }
	    
	    int result = tourService.insertTour(tsd, lod, rd, led, ti);
	    
	    // 결과에 따른 응답페이지 처리
	    if(result > 0) { // 성공
	        session.setAttribute("alertMsg", "성공적으로 여행지가 등록되었습니다.");
	        mv.setViewName("redirect:/adminTour.ad");
	    } else { // 실패
	        mv.addObject("errorMsg", "등록 실패")
	          .setViewName("common/errorPage");
	    }

	    return mv;
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
	
	@GetMapping(value="getLocation.to", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getLocation(String areaCode, String sigunguCodeNo) {
		System.out.println(areaCode);
		System.out.println(sigunguCodeNo);
		if(Integer.parseInt(areaCode)>30) {
			City c = tourService.getLocationCity(Integer.parseInt(sigunguCodeNo));
			return new Gson().toJson(c);
			//System.out.println(c);
		}else {
			Districts d = tourService.getLocationArea(Integer.parseInt(areaCode));
			return new Gson().toJson(d);
			//System.out.println(d);
		}
		
	}
	//------------------ 일반 메서드 영역 ------------------------------------------------------
	
	// 유진 - 파일 처리용 메서드 작성 (2024.06.12)
	public String savePath(MultipartFile file, HttpSession session, String type) {
	    // 업로드하고자 하는 물리적인 서버의 경로 알아내기
	    String savePath = session.getServletContext().getRealPath("/resources/tourUpfiles/");
	    
	    // 파일명 설정
	    String fileName = type + "_" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
	    
	    // 파일 업로드
	    try {
	        file.transferTo(new File(savePath + fileName));
	    } catch (IllegalStateException | IOException e) {
	        e.printStackTrace();
	    }
	    
	    // 파일 경로명이 된 파일명 문자열 반환
	    return fileName;
	}

	// 다중 파일의 경우
	public ArrayList<String> savePaths(ArrayList<MultipartFile> files, HttpSession session, String type) {
		ArrayList<String> fileNames = new ArrayList<>();
	    for (MultipartFile file : files) {
	        String fileName = savePath(file, session, type);
	        fileNames.add(fileName);
	    }
	    return fileNames;
	}
}

