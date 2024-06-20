// �쑀吏� - tour �뙣�궎吏� �깮�꽦 (2024.06.10)
package com.tp.travely.tour.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.tp.travely.common.model.vo.PageInfo;
import com.tp.travely.common.template.Pagination;
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
	
	// �쑀吏� - 2024.06.10
	// 愿�由ъ옄 �뿬�뻾吏� 紐⑸줉 議고쉶 而⑦듃濡ㅻ윭
	@GetMapping("adminTour.ad")
	public String adminTourListView(Model model) {
		
		// 寃뚯떆湲� 紐⑸줉 議고쉶
		ArrayList<Tour> list = tourService.adminTourList();
		// System.out.println(list);
		// System.out.println("-------------------");
		// �쓳�떟�뜲�씠�꽣 �떞湲�
		model.addAttribute("tList", list);
		
		// �쓳�떟�럹�씠吏� �룷�썙�뵫
		return "admin/adminTourListView";
	}
	
	// �쑀吏� - 2024.06.10
	// 愿�由ъ옄 �뿬�뻾吏� 異붽� (�럹�씠吏�濡� �씠�룞�븯�뒗) 而⑦듃濡ㅻ윭
	@GetMapping("adminTourEnroll.ad")
	public String adminTourEnrollForm(Model model) {
		// �쓳�떟�럹�씠吏� �룷�썙�뵫
		return "admin/adminTourEnrollForm";
	}
	
	// �쑀吏� - 2024.06.11 (�떎�젣 �옉�꽦 - 2024.06.12)
	// 愿�由ъ옄 �뿬�뻾吏� 異붽� 而⑦듃濡ㅻ윭 (INSERT)
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
		
		// System.out.println("----------1");
		// System.out.println(tsd);
		// System.out.println(lod);
		// System.out.println(rd);
		// System.out.println(led);
		// System.out.println(ti);
		// System.out.println("----------");
		
		// �뙆�씪 �뾽濡쒕뱶 諛� 寃쎈줈 �꽕�젙
		String thumbImg = savePath(thumbImgFile, session, "thumbImg"); // �뜽�꽕�씪
		
		ArrayList<String> changeNos = savePaths(changeNoFiles, session, "changeNo");
		ArrayList<TourImg> tourImgList = new ArrayList<>(); // �씪諛섏씠誘몄��뱾
		
		String fileBasePath = "resources/tourUpfiles/";
		String fullThumbImgPath = fileBasePath + thumbImg;

		// 媛앹껜�뱾�뿉 寃쎈줈 �꽕�젙
		// 媛� 媛앹껜�뱾�뿉 �뜽�꽕�씪 �떞湲�
		tsd.setThumbImg(fullThumbImgPath);
		lod.setThumbImg(fullThumbImgPath);
		rd.setThumbImg(fullThumbImgPath);
		led.setThumbImg(fullThumbImgPath);

		// �떎以� �뙆�씪(李멸퀬�씠誘몄��뱾)�� �썝�옒 �뵲濡� �엳�뿀�뜕 TourImg 媛앹껜�뿉 �떞湲�
		for(String changeNo : changeNos) {
			TourImg tourImg = new TourImg();
			tourImg.setChangeNo(fileBasePath + changeNo);
			tourImgList.add(tourImg);
		}
		// System.out.println("tourType: "+tourType);
		// System.out.println(tsd);
		// �꽌鍮꾩뒪 �샇異�
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
		
		 System.out.println("----------2");
		 System.out.println(tsd);
		 System.out.println(lod);
		 System.out.println(rd);
		 System.out.println(led);
		 System.out.println(ti);
		 System.out.println(tourImgList);
		 System.out.println("----------");

		// 寃곌낵�뿉 �뵲瑜� 泥섎━
		if(result > 0) {
			session.setAttribute("alertMsg", "�꽦怨듭쟻�쑝濡� �뿬�뻾吏�媛� �벑濡앸릺�뿀�뒿�땲�떎.");
			mv.setViewName("redirect:/adminTour.ad");
		} else {
			mv.addObject("errorMsg", "�벑濡� �떎�뙣").setViewName("common/errorPage");
		}

		return mv;
	}
	
	// 源��룞�쁽 - 2024.06.11
	// �뿬�뻾吏� 議고쉶 硫붿냼�뱶(SELECT)
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
	public String getSearchList(String type,String areaCode,String areaName,int pno,String keyword) {
//		System.out.println(type);
//		System.out.println(areaCode);
//		System.out.println(areaName);
//		System.out.println(pno);
//		System.out.println(keyword);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type",type);
		map.put("name",areaName);
		map.put("keyword",keyword);
		int listCount = tourService.searchTourListCount(map);
		PageInfo pinfo = getPagInfo(listCount,type, pno, map);
		//System.out.println(pinfo);
		int start = (pinfo.getCurrentPage()-1)*pinfo.getBoardLimit()+1;
		int end = (pinfo.getCurrentPage()*pinfo.getBoardLimit());
		map.put("start", (start+""));
		map.put("end",(end+""));
		ArrayList<Tour> list = tourService.selectSearchList(map);
//		for(Tour t : list) {
//			System.out.println(t);
//		}
		HashMap<String,Object> rtData = new HashMap<String, Object>();
		rtData.put("list", list);
		rtData.put("page",pinfo);
		return new Gson().toJson(rtData);
	}
	
	// �쑀吏�&�쁽�꽦 - 愿�由ъ옄 �뿬�뻾吏� �긽�꽭議고쉶 而⑦듃濡ㅻ윭 (2024.06.14)
		@ResponseBody
		@GetMapping(value="tourDetailView.to",produces="application/json; charset=UTF-8")
		public String tourDetailView(Tour tour) {
//			System.out.println("controller �꽦怨�");
//			System.out.println(tour);
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
				// �떎瑜� �씠誘몄��뱾�룄 媛��졇���빞�븳�떎.
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
			// �궗吏�(�뜽�꽕�씪 �젣�쇅 �떎瑜� 異붽��씠誘몄��뱾)�뱾 諛쏆쓣 諛곗뿴 = service.xml();
		}
		
	// �쑀吏� - 愿�由ъ옄 �뿬�뻾吏� �궘�젣 而⑦듃濡ㅻ윭 (2024.06.17)
	@PostMapping(value="deleteTour.to")
	public ModelAndView deleteTour(int tourNo, String thumbImg, HttpSession session, ModelAndView mv) {
		int result = 0;
		result = tourService.deleteTour(tourNo);
		
		// 寃곌낵�뿉 �뵲瑜� 泥섎━
		if(result > 0) {
			if(!thumbImg.equals("")) {
				String realPath 
					= session.getServletContext()
							 .getRealPath(thumbImg);
				
				// realPath 媛� 媛�由ы궎�뒗 �뙆�씪 媛앹껜 �깮�꽦 �썑 delete
				new File(realPath).delete();
			}
			
			session.setAttribute("alertMsg", "�꽦怨듭쟻�쑝濡� �뿬�뻾吏�媛� �궘�젣�릺�뿀�뒿�땲�떎.");
			mv.setViewName("redirect:/adminTour.ad");
		} else {
			mv.addObject("errorMsg", "�궘�젣 �떎�뙣").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// �쑀吏� - 愿�由ъ옄 �뿬�뻾吏� �닔�젙 而⑦듃濡ㅻ윭 (2024.06.18)
	// 愿�由ъ옄 �뿬�뻾吏� 異붽� (�럹�씠吏�濡� �씠�룞�븯�뒗) 而⑦듃濡ㅻ윭
	@PostMapping(value="adminTourUpdate.ad")
	public String adminTourUpdateForm(@RequestParam("tourNo") int tourNo, Model model) {
		
		// �뿬�뻾吏� �븳 怨� 議고쉶
		System.out.println("�꽆�뼱�삩 湲�踰덊샇�뒗 " + tourNo + "踰덉엯�땲�떎.");
		
		// Tour 媛앹껜留� 議고쉶
        Tour tour = tourService.getTourByNo(tourNo);
        
        System.out.println("�꽑�깮�븳 媛앹껜: " + tour);
        if (tour == null) {
            throw new NullPointerException("留뚯씪 null �씠�씪硫� �꽆�뼱�삩 tour 媛앹껜�쓽 踰덊샇: " + tourNo);
        }
        
        model.addAttribute("tour", tour);
        
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
			// �떎瑜� �씠誘몄��뱾�룄 媛��졇���빞�븳�떎.
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
		
		return "admin/adminTourUpdateForm";
	}
	
	//------------------ �씪諛� 硫붿꽌�뱶 �쁺�뿭 ------------------------------------------------------
	
	// �쑀吏� - �뙆�씪 泥섎━�슜 硫붿꽌�뱶 �옉�꽦 (2024.06.12)
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

	// �떎以� �뙆�씪�쓽 寃쎌슦
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

