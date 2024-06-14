// 유진 - tour 패키지 생성 (2024.06.10)
package com.tp.travely.tour.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		System.out.println(list);
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
    public ModelAndView adminTourInsert(@RequestParam("tourType") String tourType, 
    									TourSpotData tsd, LodgingData lod, RestaurantData rd, 
							            LeportsData led, TourImg ti, 
							            MultipartFile thumbImgFile, 
							            ArrayList<MultipartFile> changeNoFiles, 
							            HttpSession session, ModelAndView mv) {

		// System.out.println("----------");
		// System.out.println(thumbImgFile);
		// System.out.println(changeNoFiles);
		// System.out.println("----------");
		
		System.out.println("----------1");
		System.out.println(tsd);
		System.out.println(lod);
		System.out.println(rd);
		System.out.println(led);
		System.out.println(ti);
		System.out.println("----------");
		
		// 파일 업로드 및 경로 설정
		String thumbImg = savePath(thumbImgFile, session, "thumbImg"); // 썸네일
		
		ArrayList<String> changeNos = savePaths(changeNoFiles, session, "changeNo");
		ArrayList<TourImg> tourImgList = new ArrayList<>(); // 일반이미지들
		
		String fileBasePath = "resources/tourUpfiles/";
		String fullThumbImgPath = fileBasePath + thumbImg;

		// 객체들에 경로 설정
		// 각 객체들에 썸네일 담기
		tsd.setThumbImg(fullThumbImgPath);
		lod.setThumbImg(fullThumbImgPath);
		rd.setThumbImg(fullThumbImgPath);
		led.setThumbImg(fullThumbImgPath);
		

		// 다중 파일(참고이미지들)은 원래 따로 있었던 TourImg 객체에 담기
		for(String changeNo : changeNos) {
			TourImg tourImg = new TourImg();
			tourImg.setChangeNo(fileBasePath + changeNo);
			tourImgList.add(tourImg);
		}
		System.out.println("tourType: "+tourType);
		System.out.println(tsd);
		// 서비스 호출
		int result = 0;
		
		switch(tourType) {
		case "tourSpot" : 
			tsd.setTourtype(tourType);
			result = tourService.insertTour(tsd, ti);
			break;
		case "lodging" : 
			lod.setTourtype(tourType);
			result = tourService.insertTour(lod, ti);
			break;
		case "restaurant" : 
			rd.setTourtype(tourType);
			result = tourService.insertTour(rd, ti);
			break;
		case "leports" : 
			led.setTourtype(tourType);
			result = tourService.insertTour(led, ti);
			break;
		default : 
			break;
		}
		
		System.out.println("----------2");
		System.out.println(tsd);
		System.out.println(lod);
		System.out.println(rd);
		System.out.println(led);
		System.out.println(ti);
		System.out.println("----------");

		// 결과에 따른 처리
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 여행지가 등록되었습니다.");
			mv.setViewName("redirect:/adminTour.ad");
		} else {
			mv.addObject("errorMsg", "등록 실패").setViewName("common/errorPage");
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
	
	// 유진&현성 - 관리자 여행지 상세조회 컨트롤러 (2024.06.14)
//	@ResponseBody
	@GetMapping(value="tourDetailView.to")
	public void tourDetailView(Tour tour) {
		System.out.println("controller 성공");
		System.out.println(tour);
		
		switch(tour.getTourType()) {
		case "tourSpot" : 
			TourSpotData tsd = tourService.tourSpotDetail(tour.getTourNo());
			break;
		case "lodging" : 
			LodgingData lod = tourService.lodgingDetail(tour.getTourNo());
			break;
		case "restaurant" : 
			RestaurantData rd =tourService.restaurantDetail(tour.getTourNo());
			break;
		case "leports" : 
			LeportsData led = tourService.leportsDetail(tour.getTourNo());
			break;
		default : 
			break;
		}
		
		// 사진(썸네일 제외 다른 추가이미지들)들 받을 배열 = service.xml();
	}
	
	//------------------ 일반 메서드 영역 ------------------------------------------------------
	
	// 유진 - 파일 처리용 메서드 작성 (2024.06.12)
	public String savePath(MultipartFile file, HttpSession session, String type) {
        String savePath = session.getServletContext().getRealPath("/resources/tourUpfiles/");
        String fileName = type + "_" + System.currentTimeMillis() + "_" + StringUtils.cleanPath(file.getOriginalFilename());
        File dir = new File(savePath);
        
        if(!dir.exists()) {
            dir.mkdirs();
        }

        try {
            file.transferTo(new File(savePath + File.separator + fileName));
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }

        return fileName;
    }

	// 다중 파일의 경우
	public ArrayList<String> savePaths(ArrayList<MultipartFile> files, HttpSession session, String type) {
		ArrayList<String> fileNames = new ArrayList<>();
        for(MultipartFile file : files) {
            if(!file.isEmpty()) {
                String fileName = savePath(file, session, type);
                fileNames.add(fileName);
            }
        }
        return fileNames;
    }
}

