// 유진 - tour 패키지 생성 (2024.06.10)
package com.tp.travely.tour.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
import com.tp.travely.common.model.vo.PageInfo;
import com.tp.travely.member.model.vo.Member;
import com.tp.travely.tour.model.service.TourService;
import com.tp.travely.tour.model.vo.City;
import com.tp.travely.tour.model.vo.Districts;
import com.tp.travely.tour.model.vo.LeportsData;
import com.tp.travely.tour.model.vo.LodgingData;
import com.tp.travely.tour.model.vo.RestaurantData;
import com.tp.travely.tour.model.vo.Tour;
import com.tp.travely.tour.model.vo.TourImg;
import com.tp.travely.tour.model.vo.TourReview;
import com.tp.travely.tour.model.vo.TourSpotData;

@Controller
public class TourController {
	private static final String KEY = "kSu5EX07G5ba6MAXMOBjLbV30e%2B28Xhh3Q3Qo2gqkDtwhS7B7GcUKKKg8D8va2qlva530vfM095CqfAWEGemmw%3D%3D";
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
    public ModelAndView adminTourInsert(@RequestParam("tourType") String tourType, 
    									TourSpotData tsd, LodgingData lod, RestaurantData rd, 
							            LeportsData led, TourImg ti, 
							            MultipartFile thumbImgFile, 
							            ArrayList<MultipartFile> changeNoFiles, 
							            HttpSession session, ModelAndView mv) {

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
		
		// 서비스 호출
		int result = 0;
		
		switch(tourType) {
		case "tourSpot" : 
			tsd.setTourtype(tourType);
			result = tourService.insertTour(tsd, tourImgList);
			break;
		case "lodging" : 
			lod.setTourtype(tourType);
			result = tourService.insertTour(lod, tourImgList);
			break;
		case "restaurant" : 
			rd.setTourtype(tourType);
			result = tourService.insertTour(rd, tourImgList);
			break;
		case "leports" : 
			led.setTourtype(tourType);
			result = tourService.insertTour(led, tourImgList);
			break;
		default : 
			break;
		}
		
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
	// 김동현 - 2024.06.16
	// 시군구코드/지역 코드 조회
	@GetMapping(value="getLocation.to", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getLocation(String areaCode, String sigunguCodeNo) {
		//System.out.println(areaCode);
		System.out.println(sigunguCodeNo);
		if(Integer.parseInt(areaCode)>30&&Integer.parseInt(areaCode)<39) {
			City c = tourService.getLocationCity(Integer.parseInt(sigunguCodeNo));
			return new Gson().toJson(c);
			//System.out.println(c);
		}else {
			Districts d = tourService.getLocationArea(Integer.parseInt(areaCode));
			return new Gson().toJson(d);
			//System.out.println(d);
		}
		
	}
	// 김동현 - 2024.06.16
	// 여행지 리스트 조회
	@GetMapping(value="tourList.to",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String selectTourList(String type,String areaCode,String areaName,int pno) {
//		System.out.println(type);
//		System.out.println(areaCode);
//		System.out.println(areaName);
//		System.out.println(pno);
		//System.out.println(areaName);
		HashMap<String, String> map = new HashMap<>();
		map.put("type",type);
		map.put("name",areaName);
		int listCount=tourService.selectTourListCount(map);
		PageInfo pinfo = getPagInfo(listCount,type, pno, map);
		int start = (pinfo.getCurrentPage()-1)*pinfo.getBoardLimit()+1;
		int end = (pinfo.getCurrentPage()*pinfo.getBoardLimit());
		map.put("start", (start+""));
		map.put("end",(end+""));
		ArrayList<Tour> list = tourService.selectTourList(map);
		for(Tour t : list) {
			System.out.println(t);
		}
		//System.out.println(map);
		HashMap<String, Object> rtMap = new HashMap<String, Object>();
		rtMap.put("list",list);
		rtMap.put("page",pinfo);
		return new Gson().toJson(rtMap);
	}
	
	//김동현 2024.06.20
	// 여행지 검색 기능
	@GetMapping(value="searchTourList.to",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getSearchList(String type,String areaCode,String areaName,int pno,String keyword,String option) {
//		System.out.println(type);
//		System.out.println(areaCode);
//		System.out.println(areaName);
//		System.out.println(pno);
//		System.out.println(keyword);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type",type);
		map.put("name",areaName);
		map.put("keyword",keyword);
		map.put("option",option);
		System.out.println(map);
		int listCount = tourService.searchTourListCount(map);
		PageInfo pinfo = getPagInfo(listCount,type, pno, map);
		System.out.println(pinfo);
		int start = (pinfo.getCurrentPage()-1)*pinfo.getBoardLimit()+1;
		int end = (pinfo.getCurrentPage()*pinfo.getBoardLimit());
		map.put("start", (start+""));
		map.put("end",(end+""));
		ArrayList<Tour> list = tourService.selectSearchList(map);
//		for(Tour t : list) {
//			System.out.println(t);
//		}
		HashMap<String,Object> rtData = new HashMap<String, Object>();
		if(list.isEmpty()) {
			rtData.put("none","검색결과가 없습니다.");
		}else {
			rtData.put("list", list);
			rtData.put("page",pinfo);
			
		}
		return new Gson().toJson(rtData);
	}
	@GetMapping(value="getDetail.to", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getDetail(int tno, String contentId,String type) throws IOException {
		//System.out.println(tno);
		//System.out.println(contentId);
		System.out.println("type : "+type);
		int contentTypeId=0;
		switch(type) {
		case "관광지":
			contentTypeId=12;
			break;
		case "레포츠":
			contentTypeId=28;
			break;
		case "숙박":
			contentTypeId=32;
			break;
		case "음식점":
			contentTypeId=39;
			break;
		}
		
		String url = "https://apis.data.go.kr/B551011/KorService1/detailIntro1?";
		url+="MobileOS=ETC";
		url+="&MobileApp=Travely";
		url+="&contentId="+contentId;
		url+="&contentTypeId="+contentTypeId;
		url+="&_type=json";
		url+="&serviceKey="+KEY;
		//System.out.println(url);
		URL cUrl = new URL(url);
		HttpURLConnection connectU = (HttpURLConnection)cUrl.openConnection();
		BufferedReader br = new BufferedReader(new InputStreamReader(connectU.getInputStream(),"UTF-8"));
		String result = "";
		String line;
		while((line=br.readLine())!=null) {
			result += line;
		}
		br.close();
		connectU.disconnect();
		
		return result;
	}
	@GetMapping(value="getImg.to", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getImg(int tno, String contentId,String type) throws IOException {
		String url = "https://apis.data.go.kr/B551011/KorService1/detailImage1?";
		url+="MobileOS=ETC";
		url+="&MobileApp=Travely";
		url+="&_type=json";
		url+="&contentId="+contentId;
		url+="&imageYN=Y";
		url+="&subImageYN=Y";
		url+="&serviceKey="+KEY;
		
		URL cUrl = new URL(url);
		HttpURLConnection connectU = (HttpURLConnection)cUrl.openConnection();
		BufferedReader br = new BufferedReader(new InputStreamReader(connectU.getInputStream(),"UTF-8"));
		String result = "";
		String line;
		while((line=br.readLine())!=null) {
			result += line;
		}
		br.close();
		connectU.disconnect();
		
		return result;
	}
	@GetMapping(value="getRangeTourList.to", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getRangeTourList(double x,double y,int range,int tourType,int aroundNum) throws IOException {
		String url = "https://apis.data.go.kr/B551011/KorService1/locationBasedList1?";
		url+="numOfRows=5";
		url+="&pageNo="+aroundNum;
		url+="&MobileApp=Travely";
		url+="&MobileOS=ETC";
		url+="&_type=json";
		url+="&mapX="+x;
		url+="&mapY="+y;
		url+="&radius="+range;
		url+="&contentTypeId="+tourType;
		url+="&serviceKey="+KEY;
		URL cUrl = new URL(url);
		HttpURLConnection connectU = (HttpURLConnection)cUrl.openConnection();
		BufferedReader br = new BufferedReader(new InputStreamReader(connectU.getInputStream(),"UTF-8"));
		String result = "";
		String line;
		while((line=br.readLine())!=null) {
			result += line;
		}
		br.close();
		connectU.disconnect();
		return result;
	}
	
	// 유진&현성 - 관리자 여행지 상세조회 컨트롤러 (2024.06.14)
		@ResponseBody
		@GetMapping(value="tourDetailView.to",produces="application/json; charset=UTF-8")
		public String tourDetailView(Tour tour) {
			HashMap<String, Object> rtMap = new HashMap<String, Object>();
			switch(tour.getTourType()) {
			case "tourSpot" : 
				
				TourSpotData tsd = tourService.tourSpotDetail(tour.getTourNo());
				tsd.setTourName(tour.getTourName());
				tsd.setAddress(tour.getAddress());
				tsd.setContentId(tour.getContentId());
				tsd.setThumbImg(tour.getThumbImg());
				tsd.setTourtype(tour.getTourType());
				rtMap.put("list",tsd);
				// 다른 이미지들도 가져와야한다.
				break;
			case "lodging" : 
				LodgingData lod = tourService.lodgingDetail(tour.getTourNo());
				lod.setTourName(tour.getTourName());
				lod.setAddress(tour.getAddress());
				lod.setContentId(tour.getContentId());
				lod.setThumbImg(tour.getThumbImg());
				lod.setTourtype(tour.getTourType());
				rtMap.put("list",lod);
				break;
			case "restaurant" : 
				RestaurantData rd =tourService.restaurantDetail(tour.getTourNo());
				rd.setTourName(tour.getTourName());
				rd.setAddress(tour.getAddress());
				rd.setContentId(tour.getContentId());
				rd.setThumbImg(tour.getThumbImg());
				rd.setTourtype(tour.getTourType());
				rtMap.put("list",rd);
				break;
			case "leports" : 
				LeportsData led = tourService.leportsDetail(tour.getTourNo());
				led.setTourName(tour.getTourName());
				led.setAddress(tour.getAddress());
				led.setContentId(tour.getContentId());
				led.setThumbImg(tour.getThumbImg());
				led.setTourtype(tour.getTourType());
				rtMap.put("list",led);
				break;
			default : 
				break;
			}
			ArrayList<TourImg> imgList = tourService.tourImgList(tour.getTourNo());
			rtMap.put("img",imgList);


			return new Gson().toJson(rtMap);
			// 사진(썸네일 제외 다른 추가이미지들)들 받을 배열 = service.xml();
		}
		
	// 유진 - 관리자 여행지 삭제 컨트롤러 (2024.06.17)
	@PostMapping(value="deleteTour.to")
	public ModelAndView deleteTour(int tourNo, String thumbImg, HttpSession session, ModelAndView mv) {
		int result = 0;
		result = tourService.deleteTour(tourNo);
		
		// 결과에 따른 처리
		if(result > 0) {
			if(!thumbImg.equals("")) {
				String realPath 
					= session.getServletContext()
							 .getRealPath(thumbImg);
				
				// realPath 가 가리키는 파일 객체 생성 후 delete
				new File(realPath).delete();
			}
			
			session.setAttribute("alertMsg", "성공적으로 여행지가 삭제되었습니다.");
			mv.setViewName("redirect:/adminTour.ad");
		} else {
			mv.addObject("errorMsg", "삭제 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 유진 - 관리자 여행지 수정 컨트롤러 (2024.06.18)
	// 관리자 여행지 수정 (페이지로 이동하는) 컨트롤러
	@PostMapping(value="adminTourUpdateForm.ad")
	public String adminTourUpdateForm(@RequestParam("tourNo") int tourNo, @RequestParam("tourType") String tourType, Model model) {
		
		// 여행지 한 곳 조회
		// Tour 객체만 조회
        Tour tour = tourService.getTourByNo(tourNo);

        model.addAttribute("tour", tour);
        
		HashMap<String, Object> rtMap = new HashMap<String, Object>();
		
		switch(tourType) {
		case "tourSpot" : 
			TourSpotData tsd = tourService.tourSpotDetail(tour.getTourNo());
			tsd.setTourName(tour.getTourName());
			tsd.setAddress(tour.getAddress());
			tsd.setContentId(tour.getContentId());
			tsd.setThumbImg(tour.getThumbImg());
			tsd.setTourtype(tour.getTourType());
			rtMap.put("list",tsd);
			// 다른 이미지들도 가져와야한다.
			break;
		case "lodging" : 
			LodgingData lod = tourService.lodgingDetail(tour.getTourNo());
			lod.setTourName(tour.getTourName());
			lod.setAddress(tour.getAddress());
			lod.setContentId(tour.getContentId());
			lod.setThumbImg(tour.getThumbImg());
			lod.setTourtype(tour.getTourType());
			rtMap.put("list",lod);
			break;
		case "restaurant" : 
			RestaurantData rd =tourService.restaurantDetail(tour.getTourNo());
			rd.setTourName(tour.getTourName());
			rd.setAddress(tour.getAddress());
			rd.setContentId(tour.getContentId());
			rd.setThumbImg(tour.getThumbImg());
			rd.setTourtype(tour.getTourType());
			rtMap.put("list",rd);
			break;
		case "leports" : 
			LeportsData led = tourService.leportsDetail(tour.getTourNo());
			led.setTourName(tour.getTourName());
			led.setAddress(tour.getAddress());
			led.setContentId(tour.getContentId());
			led.setThumbImg(tour.getThumbImg());
			led.setTourtype(tour.getTourType());
			rtMap.put("list",led);
			break;
		default : 
			break;
		}
		
		ArrayList<TourImg> imgList = tourService.tourImgList(tour.getTourNo());
		rtMap.put("img",imgList);
		
		model.addAttribute("rtMap", rtMap);
		model.addAttribute("imgList", imgList);
		
		return "admin/adminTourUpdateForm";
	}
	
	// 유진 - 관리자 여행지 수정 컨트롤러 (2024.06.23)
	// 관리자 여행지 수정 컨트롤러
	@PostMapping(value="adminTourUpdate.ad")
	public ModelAndView adminTourUpdate(@RequestParam("tourType") String tourType, Tour tour, 
										TourSpotData tsd, LodgingData lod, RestaurantData rd, 
							            LeportsData led, TourImg ti, 
							            MultipartFile reThumbImg, 
							            ArrayList<MultipartFile> reChangeNoFiles, 
							            HttpSession session, ModelAndView mv) {
		
		// 새로 들어온 대표 이미지 파일이 있다면
	    if(reThumbImg != null && !reThumbImg.isEmpty()) {
	        // 원래 있었던 대표 이미지 파일 위치 찾아 삭제
	        String realPath = session.getServletContext().getRealPath(tour.getThumbImg());
	        new File(realPath).delete();

	        // 새로 들어온 대표 이미지 파일 추가
	        String changeName = savePath(reThumbImg, session, "thumbImg");
	        String fullThumbImgPath = "resources/tourUpfiles/" + changeName;
	        tour.setThumbImg(fullThumbImgPath);

	        // 각 객체들에 썸네일 담기
	        tsd.setThumbImg(fullThumbImgPath);
	        lod.setThumbImg(fullThumbImgPath);
	        rd.setThumbImg(fullThumbImgPath);
	        led.setThumbImg(fullThumbImgPath);
	    }
		
		// 기존 추가 이미지 파일 목록 가져오기
	    ArrayList<TourImg> existingTourImgs = tourService.getTourImgsByTourNo(tour.getTourNo());
	    ArrayList<TourImg> updatedTourImgs = new ArrayList<>();
	    
	    // 새로 들어온 파일이 있다면
	    boolean hasNewFiles = reChangeNoFiles != null && !reChangeNoFiles.isEmpty() && reChangeNoFiles.stream().anyMatch(file -> !file.isEmpty());

	    if (hasNewFiles) {
	        int existingSize = existingTourImgs.size();
	        int newSize = reChangeNoFiles.size();
	        
	        // 새 TourImg 객체 생성
            TourImg tourImg = new TourImg();
	        
	        // 새로운 추가 이미지 파일 처리
	        for (int i = 0; i < newSize; i++) {
	            MultipartFile file = reChangeNoFiles.get(i);
	            System.out.println("-------------------------");
	            System.out.println(file);
	            System.out.println("-------------------------");

	            if (!file.isEmpty()) {
	                // 새 파일 저장
	                String changeName = savePath(file, session, "changeNo");
	                String fullChangeNoPath = "resources/tourUpfiles/" + changeName;

	                tourImg.setChangeNo(fullChangeNoPath);
	                tourImg.setRefTno(tour.getTourNo());

	                if (i < existingSize) {
	                    // 기존 파일 삭제
	                    String realPath = session.getServletContext().getRealPath(existingTourImgs.get(i).getChangeNo());
	                    if (new File(realPath).exists()) {
	                        new File(realPath).delete();
	                    }
	                    tourImg.setTimgNo(existingTourImgs.get(i).getTimgNo()); // 기존 TimgNo 유지
	                }

	                updatedTourImgs.add(tourImg);
	            } else {
	                // 파일이 비어있으면 기존 파일 유지
	                if (i < existingSize) {
	                	tourImg.setTimgNo(existingTourImgs.get(i).getTimgNo()); // 기존 TimgNo 유지
	                    updatedTourImgs.add(existingTourImgs.get(i));
	                }
	            }
	        }

	        // 기존 파일 중에서 남아 있는 파일 유지
	        for (int i = newSize; i < existingSize; i++) {
	            updatedTourImgs.add(existingTourImgs.get(i));
	        }
	    } else {
	        // 새 파일이 없을 경우 기존 파일 유지
	        updatedTourImgs = existingTourImgs;
	    }

	    // 결과 확인
	    System.out.println("변경된 추가이미지들 : " + updatedTourImgs);
	    
		// 서비스 호출
		int result = 0;
		result = tourService.updateTour(tour); // 공통으로 수정되는 부분
		
		switch(tourType) {
		case "tourSpot" : 
			tsd.setTourtype(tourType);
			tsd.setRefTno(tour.getTourNo());
			result = tourService.updateTour(tsd, updatedTourImgs);
			break;
		case "lodging" : 
			lod.setTourtype(tourType);
			lod.setRefTno(tour.getTourNo());
			result = tourService.updateTour(lod, updatedTourImgs);
			break;
		case "restaurant" : 
			rd.setTourtype(tourType);
			rd.setRefTno(tour.getTourNo());
			result = tourService.updateTour(rd, updatedTourImgs);
			break;
		case "leports" : 
			led.setTourtype(tourType);
			led.setRefTno(tour.getTourNo());
			result = tourService.updateTour(led, updatedTourImgs);
			break;
		default : 
			break;
		}
		
		// 결과에 따른 처리
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 여행지가 수정되었습니다.");
			mv.setViewName("redirect:/adminTour.ad");
		} else {
			mv.addObject("errorMsg", "수정 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@ResponseBody
	@GetMapping(value="reviewList.ad",produces="application/json; charset=UTF-8")
	public String reviewList(int tourNo, Model model) {
		
		ArrayList<TourReview> list = tourService.reviewList(tourNo);

		
		HashMap<String, Object> rtMap = new HashMap<String, Object>();
		
		if(!list.isEmpty()) {
			rtMap.put("rList", list);
			ArrayList<Member> mList = tourService.reviewMemberList(tourNo);
			if(!mList.isEmpty()) {
				rtMap.put("mList", mList);
			}
			
		}else {
			model.addAttribute("alertMsg", "에러");
		}
		
		return new Gson().toJson(rtMap);
	}
	
	@ResponseBody
	@PostMapping(value="reviewDelete.ad",produces="application/text; charset=UTF-8")
	public String reviewDelete(int reviewNo) {
		
		int result = tourService.reviewDelete(reviewNo);
		String s = "";
		if(result > 0) {
			s = "성공";
		}else {
			s = "실패";
		}
		
		return s;
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
	
	// 페이징 처리 메소드
	public PageInfo getPagInfo(int count,String type,int pno, Map<String, String> map) {
		
		int listCount = count;
		int currentPage = pno;
		int pageLimit = 5;
		int boardLimit = 5;
		
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		int startPage= (((currentPage-1)/pageLimit)*pageLimit)+1;
		int endPage = startPage+(pageLimit-1);
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		
		return new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	}
}

