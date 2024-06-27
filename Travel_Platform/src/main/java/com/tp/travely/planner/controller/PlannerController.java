package com.tp.travely.planner.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.tp.travely.common.model.vo.PageInfo;
import com.tp.travely.member.model.vo.Member;
import com.tp.travely.planner.model.service.PlannerService;
import com.tp.travely.planner.model.vo.PlanDetail;
import com.tp.travely.planner.model.vo.PlanReply;
import com.tp.travely.planner.model.vo.Planner;
import com.tp.travely.tour.model.service.TourService;
import com.tp.travely.tour.model.vo.City;
import com.tp.travely.tour.model.vo.Districts;

@Controller
public class PlannerController {
	
	@Autowired
	private PlannerService plannerService;
	@Autowired
	private TourService tourService;
	
	@PostMapping(value="savePlanner.pl")
	public String savePlanner(MultipartFile file,String plan, String title,String content,String ckOpen,HttpSession session) {
//		System.out.println(plan);
//		System.out.println(file);
//		System.out.println(title);
//		System.out.println(content);
//		System.out.println(ckOpen);
		//System.out.println(session.getAttribute("loginUser"));
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		//int userNo=1;
		
		 JsonObject totalObj = JsonParser.parseString(plan).getAsJsonObject();
		 JsonObject planObj = totalObj.getAsJsonObject("plan"); 
		 JsonArray planArr = planObj.getAsJsonArray("planList");
		
		 String name = title;
		 String exp = content; 
		 //String startD = planObj.get("startDate").getAsString().substring(0,10); 
		 //String endD = planObj.get("endDate").getAsString().substring(0,10);
		 
		 DateTimeFormatter isoFormatter = DateTimeFormatter.ISO_OFFSET_DATE_TIME;

        // 클라이언트에서 받은 ISO 8601 형식의 시간을 파싱하여 ZonedDateTime으로 변환
        ZonedDateTime startUTC = ZonedDateTime.parse(planObj.get("startDate").getAsString(), isoFormatter);
        ZonedDateTime endUTC = ZonedDateTime.parse(planObj.get("endDate").getAsString(), isoFormatter);

        // ZonedDateTime을 한국 표준시(KST)로 변환
        ZonedDateTime startKST = startUTC.withZoneSameInstant(ZoneId.of("Asia/Seoul"));
        ZonedDateTime endKST = endUTC.withZoneSameInstant(ZoneId.of("Asia/Seoul"));

        // 결과 포맷터 설정 (원하는 출력 형식으로 변환)
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	           
	     String startD = startKST.format(outputFormatter);
	     String endD = endKST.format(outputFormatter);

//		 System.out.println(startKST.format(outputFormatter));
//		 System.out.println(endKST.format(outputFormatter));
	     
	     
		 Planner planner = new Planner();
		 planner.setRefUno(userNo);
		 planner.setPlanName(name);
		 planner.setPlanExp(exp);
		 planner.setStartDate(startD);
		 planner.setEndDate(endD);
		 planner.setAreaCode(planObj.get("areaCode").getAsInt());
		 if(planObj.get("sigunguCodeNo").getAsInt()!=0) {
			 planner.setSigunguCodeNo(planObj.get("sigunguCodeNo").getAsInt());
		 }
		 
		 if(ckOpen!=null) {
			 planner.setPlStatus("Y");
		 }else {
			 planner.setPlStatus("N");
		 }
		 
		 
		 if(!file.getOriginalFilename().equals("")) {
				String changeName = "resources/planImg/"+savePath(file, session);
				planner.setChangeName(changeName);
		}
		 //System.out.println(planner);
		 ArrayList<PlanDetail> detailList = new ArrayList<PlanDetail>(); 
		 for(int i =0;i<planArr.size();i++) { 
			 JsonObject item = planArr.get(i).getAsJsonObject();
			 JsonArray tourArr = item.getAsJsonArray("tourList");
			 //System.out.println(tourArr); 
			 for(int j=0;j<tourArr.size();j++) { 
			 PlanDetail pDetail = new PlanDetail();
			 ZonedDateTime dateUTC = ZonedDateTime.parse(item.get("date").getAsString(), isoFormatter);
		     ZonedDateTime dateKST = dateUTC.withZoneSameInstant(ZoneId.of("Asia/Seoul"));
		     String DateD = dateKST.format(outputFormatter);
		     pDetail.setPlanDate(DateD);
			 pDetail.setStartTime(item.get("startTimeH").getAsString()+":"+item.get("startTimeM").getAsString());
			 pDetail.setEndTime(item.get("endTimeH").getAsString()+":"+item.get("endTimeM").getAsString()); pDetail.setDayCount(item.get("dayCount").getAsInt());
			 if(tourArr.get(j).getAsJsonObject().get("tno").getAsInt()==0) { 
				 String contentId = tourArr.get(j).getAsJsonObject().get("contentId").getAsString();
				 int tno = plannerService.getTNOBycontentId(contentId);
				 //System.out.println(tno); 
				 pDetail.setRefTno(tno); 
			 }else {
				 pDetail.setRefTno(tourArr.get(j).getAsJsonObject().get("tno").getAsInt()); }
			 	 pDetail.setTime(tourArr.get(j).getAsJsonObject().get("time").getAsString());
			 	 detailList.add(pDetail); 
			 } 
		}
		 for(PlanDetail p : detailList) {
				System.out.println(p);
			}
		int rs = plannerService.insertPlanner(planner,detailList);
		 //System.out.println(planner); 
		
		if(rs>0) {
			session.setAttribute("msg", "저장 성공!");
			return "redirect:/goList.pl";
		}else {
			return "redirect:/index";
		}
		
	}
	@PostMapping(value="updatePlan.pl")
	public String changePlanner(MultipartFile file,String plan, String title,String content,String ckOpen,HttpSession session) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		JsonObject totalObj = JsonParser.parseString(plan).getAsJsonObject();
		JsonObject planObj = totalObj.getAsJsonObject("plan"); 
		JsonArray planArr = planObj.getAsJsonArray("planList");
		
		String name = title;
		String exp = content;
		
		DateTimeFormatter isoFormatter = DateTimeFormatter.ISO_OFFSET_DATE_TIME;

        // 클라이언트에서 받은 ISO 8601 형식의 시간을 파싱하여 ZonedDateTime으로 변환
        ZonedDateTime startUTC = ZonedDateTime.parse(planObj.get("startDate").getAsString(), isoFormatter);
        ZonedDateTime endUTC = ZonedDateTime.parse(planObj.get("endDate").getAsString(), isoFormatter);
        
        // ZonedDateTime을 한국 표준시(KST)로 변환
        ZonedDateTime startKST = startUTC.withZoneSameInstant(ZoneId.of("Asia/Seoul"));
        ZonedDateTime endKST = endUTC.withZoneSameInstant(ZoneId.of("Asia/Seoul"));

        // 결과 포맷터 설정 (원하는 출력 형식으로 변환)
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	           
	    String startD = startKST.format(outputFormatter);
	    String endD = endKST.format(outputFormatter);
	    
	    Planner planner = new Planner();
	    int pk = planObj.get("planNo").getAsInt();
		planner.setRefUno(userNo);
		planner.setPlanName(name);
		planner.setPlanExp(exp);
		planner.setStartDate(startD);
		planner.setEndDate(endD);
		planner.setAreaCode(planObj.get("areaCode").getAsInt());
		planner.setPlanNo(pk);
		if(planObj.get("sigunguCodeNo").getAsInt()!=0) {
			 planner.setSigunguCodeNo(planObj.get("sigunguCodeNo").getAsInt());
		}
		 
		if(ckOpen!=null) {
			 planner.setPlStatus("Y");
		}else {
			 planner.setPlStatus("N");
		}
		 
		 
		if(!file.getOriginalFilename().equals("")) {
				String changeName = "resources/planImg/"+savePath(file, session);
				planner.setChangeName(changeName);
		}
		
		ArrayList<PlanDetail> detailList = new ArrayList<PlanDetail>(); 
		 for(int i =0;i<planArr.size();i++) { 
			 JsonObject item = planArr.get(i).getAsJsonObject();
			 JsonArray tourArr = item.getAsJsonArray("tourList");
			 //System.out.println(tourArr); 
			 for(int j=0;j<tourArr.size();j++) { 
			 PlanDetail pDetail = new PlanDetail();
			 ZonedDateTime dateUTC = ZonedDateTime.parse(item.get("date").getAsString(), isoFormatter);
		     ZonedDateTime dateKST = dateUTC.withZoneSameInstant(ZoneId.of("Asia/Seoul"));
		     String DateD = dateKST.format(outputFormatter);
		     pDetail.setPlanDate(DateD);
		     pDetail.setDetailNo(tourArr.get(j).getAsJsonObject().get("detailNo").getAsInt());
		     pDetail.setRefPno(pk);
		     //System.out.println(DateD);
			 pDetail.setStartTime(item.get("startTimeH").getAsString()+":"+item.get("startTimeM").getAsString());
			 pDetail.setEndTime(item.get("endTimeH").getAsString()+":"+item.get("endTimeM").getAsString()); pDetail.setDayCount(item.get("dayCount").getAsInt());
			 if(tourArr.get(j).getAsJsonObject().get("tno").getAsInt()==0) { 
				 String contentId = tourArr.get(j).getAsJsonObject().get("contentId").getAsString();
				 int tno = plannerService.getTNOBycontentId(contentId);
				 //System.out.println(tno); 
				 pDetail.setRefTno(tno); 
			 }else {
				 pDetail.setRefTno(tourArr.get(j).getAsJsonObject().get("tno").getAsInt()); }
			 	 pDetail.setTime(tourArr.get(j).getAsJsonObject().get("time").getAsString());
			 	 detailList.add(pDetail); 
			 } 
		}
		 System.out.println(planner);
		 for(PlanDetail p : detailList) {
				System.out.println(p);
			}
		 
		 int rs = plannerService.updatePlanner(planner, detailList);
		 //System.out.println(planner); 
		
		if(rs>0) {
			session.setAttribute("msg", "저장 성공!");
			return "redirect:/goList.pl";
		}else {
			return "redirect:/index";
		}
		
	}
	
	@GetMapping("goList.pl")
	public String goPlannerList() {
		
		
		return "planner/plannerList";
	}
	@GetMapping("goPlanner.pl")
	public String goPlanner() throws ParseException {
		String start = "2024-06-28 00:00:00";
		String end = "2024-06-29 23:59:59";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date sd = formatter.parse(start);
		Date ed = formatter.parse(end);
		System.out.println(sd);
		System.out.println(ed);
		//System.out.println(ed-sd);
		return "/planner/plannerView";
	}
	
	@GetMapping(value="getPlanList.pl",produces="application/json;charset=UTF-8")
	@ResponseBody
	public String selectPlanList(int pno,String sortType) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("sortType", sortType);
		int listCount = plannerService.selectPlanListCount();
		PageInfo pinfo = getPagInfo(listCount, pno,10,12);
		int start = (pinfo.getCurrentPage()-1)*pinfo.getBoardLimit()+1;
		int end = (pinfo.getCurrentPage()*pinfo.getBoardLimit());
		map.put("start", (start+""));
		map.put("end",(end+""));
		ArrayList<Planner> list = plannerService.selectPlanList(map);
		HashMap<String, Object> rsMap = new HashMap<String, Object>();
		rsMap.put("list",list);
		rsMap.put("pinfo",pinfo);
		return new Gson().toJson(rsMap);
	}
	
	@GetMapping(value="ckTour.pl",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String checkTour(int contentId) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int rs = plannerService.checkTour(contentId);
		map.put("ck", rs);
		return new Gson().toJson(map);
	}
	@GetMapping(value="getPlanSearchList.pl",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String searchPlan(int pno,String keyword,String sortType) {
		HashMap<String, String> map = new HashMap<>();
		map.put("keyword",keyword);
		map.put("sortType", sortType);
		int listCount = plannerService.searchPlanCount(keyword);
		PageInfo pinfo = getPagInfo(listCount, pno,10,12);
		int start = (pinfo.getCurrentPage()-1)*pinfo.getBoardLimit()+1;
		int end = (pinfo.getCurrentPage()*pinfo.getBoardLimit());
		map.put("start", (start+""));
		map.put("end",(end+""));
		ArrayList<Planner> list = plannerService.searchPlanList(map);
		HashMap<String, Object> rsMap = new HashMap<String, Object>();
		rsMap.put("list",list);
		rsMap.put("pinfo",pinfo);
		return new Gson().toJson(rsMap);
	}
	@GetMapping("detail.pl")
	public String goDetailForm(int pno,Model model) {
		int rs = plannerService.addCount(pno);
		
		if(rs>0) {
			Planner p = plannerService.getPlannerByPNO(pno);
//			Planner p = new Planner();
//			p.setAreaCode(3);
//			p.setSigunguCodeNo(0);
			Double xx=0.0;
			Double yy=0.0;
			if(p.getSigunguCodeNo()!=0) {
				City c = tourService.getLocationCity(p.getSigunguCodeNo());
				xx = c.getLocationXX();
				yy = c.getLocationYY();
			}else {
				Districts d = tourService.getLocationArea(p.getAreaCode());
				xx = d.getLocationXX();
				yy = d.getLocationYY();
			}
			//System.out.println(xx);
			//System.out.println(yy);
			
			ArrayList<PlanDetail> list = plannerService.getDetail(pno);
//			for(PlanDetail pd : list) {
//				System.out.println(pd);
//			}
			model.addAttribute("planner",new Gson().toJson(p));
			model.addAttribute("p", p);
			model.addAttribute("l", list);
			model.addAttribute("list",new Gson().toJson(list));
			model.addAttribute("xx", xx);
			model.addAttribute("yy", yy);
			//System.out.println(p);
			//model.addAttribute("xx", 127.928144444444);
			//model.addAttribute("yy", 36.9881805555555);
			return "planner/planDetail";
		}else {
			model.addAttribute("errorMsg", "요류 발생");
			return "common/errorPage";
		}
	}
	@PostMapping(value="addReply.pl")
	@ResponseBody
	public String addReply(String content,int pno,HttpSession session) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		//int userNo=1;
		PlanReply pr = new PlanReply();
		pr.setRefPno(pno);
		pr.setRefUno(userNo);
		pr.setPrContent(content);
		//System.out.println(pno);
		//System.out.println(content);
		int rs = plannerService.addReply(pr);
		return new Gson().toJson(rs);
	}
	@GetMapping(value="getReply.pl", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getReply(int pno,int rno) {
		HashMap<String, String> map = new HashMap<>();
		map.put("pno", pno+"");
		int listCount = plannerService.selectReplyCount(map);
		PageInfo pinfo = getPagInfo(listCount, rno,10,5);
		int start = (pinfo.getCurrentPage()-1)*pinfo.getBoardLimit()+1;
		int end = (pinfo.getCurrentPage()*pinfo.getBoardLimit());
		map.put("start", (start+""));
		map.put("end",(end+""));
		
		ArrayList<PlanReply> list = plannerService.getReply(map);
		HashMap<String,Object> rsMap = new HashMap<String, Object>();
		rsMap.put("list", list);
		rsMap.put("pinfo",pinfo);
		return new Gson().toJson(rsMap);
	}
	
	@GetMapping(value="getMyPlanList.pl", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getMyPlanList(int pno,HttpSession session) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo(); 
		System.out.println(userNo);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userNo", userNo+"");
		int listCount = plannerService.getMyPlannerCount(map);
		System.out.println(listCount);
		PageInfo pinfo = getPagInfo(listCount, pno,10,9);
		int start = (pinfo.getCurrentPage()-1)*pinfo.getBoardLimit()+1;
		int end = (pinfo.getCurrentPage()*pinfo.getBoardLimit());
		map.put("start", (start+""));
		map.put("end",(end+""));
		System.out.println(pinfo);
		ArrayList<Planner> list = plannerService.getMyPlannerList(map);
		for(Planner p : list) {
			System.out.println(p);
		}
		HashMap<String, Object> rsMap = new HashMap<String, Object>();
		rsMap.put("list", list);
		rsMap.put("pinfo", pinfo);
		return new Gson().toJson(rsMap);
	}
	@GetMapping(value="changePlan.pl")
	public String changePlanForm(int pno, Model model) {
		Planner p = plannerService.getPlannerByPNO(pno);
		ArrayList<PlanDetail> list = plannerService.getDetail(pno);
		
		if(p.getSigunguCodeNo()!=0) {
			City c = tourService.getLocationCity(p.getSigunguCodeNo());
			model.addAttribute("areaName", c.getSigunguName());
		}else {
			Districts d = tourService.getLocationArea(p.getAreaCode());
			model.addAttribute("areaName", d.getLocationName());
		}
		System.out.println(p);
		for(PlanDetail pd : list) {
			System.out.println(pd);
		}
		
		model.addAttribute("p", p);
		model.addAttribute("planner",new Gson().toJson(p));
		model.addAttribute("list",new Gson().toJson(list));
		
		return "/planner/plannerView";
	}
	
	
	// �씪諛섎찓�냼�뱶
	public String savePath(MultipartFile upfile,
			   HttpSession session) {

		
		String originName = upfile.getOriginalFilename(); 
									// "bono.jpg"
		
		
		String currentTime 
			= new SimpleDateFormat("yyyyMMddHHmmss")
								.format(new Date());
									// "20240521161430" 
		
		int ranNum = (int)(Math.random() * 90000 + 10000);
									// 12345
		
		
		String ext 
		= originName.substring(originName.lastIndexOf("."));
									// ".jpg"
		
		
		String changeName = currentTime + ranNum + ext;
		
		
		String savePath
			= session.getServletContext()
					 .getRealPath("/resources/planImg/");
		
		
		try {
		
		upfile.transferTo(new File(savePath + changeName));
		
		} catch (IllegalStateException | IOException e) {
		e.printStackTrace();
		}
		
		
		return changeName;
	}
	
	// 일반 메소드
	public PageInfo getPagInfo(int count,int pno,int pageLimit,int boardLimit) {
		int listCount = count;
		int currentPage = pno;
		
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		int startPage= (((currentPage-1)/pageLimit)*pageLimit)+1;
		int endPage = startPage+(pageLimit-1);
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		
		return new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	}
}
