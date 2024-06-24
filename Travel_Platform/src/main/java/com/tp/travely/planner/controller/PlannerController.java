package com.tp.travely.planner.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
import com.tp.travely.planner.model.service.PlannerService;
import com.tp.travely.planner.model.vo.PlanDetail;
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
		System.out.println(plan);
		System.out.println(file);
		System.out.println(title);
		System.out.println(content);
		System.out.println(ckOpen);
		
		 JsonObject totalObj = JsonParser.parseString(plan).getAsJsonObject();
		 JsonObject planObj = totalObj.getAsJsonObject("plan"); 
		 JsonArray planArr = planObj.getAsJsonArray("planList");
		
		 String name = title;
		 String exp = content; 
		 String startD = planObj.get("startDate").getAsString().substring(0,10); 
		 String endD = planObj.get("endDate").getAsString().substring(0,10);
		 
		 Planner planner = new Planner(); 
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
		 System.out.println(planner);
		 ArrayList<PlanDetail> detailList = new ArrayList<PlanDetail>(); 
		 for(int i =0;i<planArr.size();i++) { 
			 JsonObject item = planArr.get(i).getAsJsonObject();
			 JsonArray tourArr = item.getAsJsonArray("tourList");
			 //System.out.println(tourArr); 
			 for(int j=0;j<tourArr.size();j++) { 
			 PlanDetail pDetail = new PlanDetail();
			 pDetail.setPlanDate(item.get("date").getAsString().substring(0, 10));
			 pDetail.setStartTime(item.get("startTimeH").getAsString()+":"+item.get("startTimeM").getAsString());
			 pDetail.setEndTime(item.get("endTimeH").getAsString()+":"+item.get("endTimeM").getAsString()); pDetail.setDayCount(item.get("dayCount").getAsInt());
			 if(tourArr.get(j).getAsJsonObject().get("tno").getAsInt()==0) { 
				 String contentId = tourArr.get(j).getAsJsonObject().get("contentId").getAsString();
				 int tno = plannerService.getTNOBycontentId(contentId);
				 //System.out.println(tno); pDetail.setRefTno(tno); 
			 }else {
				 pDetail.setRefTno(tourArr.get(j).getAsJsonObject().get("tno").getAsInt()); }
			 	 pDetail.setTime(tourArr.get(j).getAsJsonObject().get("time").getAsString());
			 	 detailList.add(pDetail); 
			 } 
		}
		int rs = plannerService.insertPlanner(planner,detailList);
		 //System.out.println(planner); 
		 
		if(rs>0) {
			return "성공";
		}else {
			return "실패";
		}
		
	}
	@GetMapping("detail.pl")
	public String goDetailForm(int pno,Model model) {
//		Planner p = plannerService.getPlannerByPNO(pno);
//		Planner p = new Planner();
//		p.setAreaCode(3);
//		p.setSigunguCodeNo(0);
//		Double xx=0.0;
//		Double yy=0.0;
//		if(p.getSigunguCodeNo()!=0) {
//			City c = tourService.getLocationCity(p.getSigunguCodeNo());
//			xx = c.getLocationXX();
//			yy = c.getLocationYY();
//		}else {
//			Districts d = tourService.getLocationArea(p.getAreaCode());
//			xx = d.getLocationXX();
//			yy = d.getLocationYY();
//		}
//		model.addAttribute("xx", xx);
//		model.addAttribute("yy", yy);
		
		model.addAttribute("xx", 127.928144444444);
		model.addAttribute("yy", 36.9881805555555);
		return "planner/planDetail";
	}
	
	// 일반메소드
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
}
