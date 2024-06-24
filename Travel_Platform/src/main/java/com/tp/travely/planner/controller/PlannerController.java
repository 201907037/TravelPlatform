package com.tp.travely.planner.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

@Controller
public class PlannerController {
	
	@Autowired
	private PlannerService plannerService;
	
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
		 if(ckOpen.equals("Y")) {
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
	
	// 일반 메소드 
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
		
		// 수정파일명 문자열을 리턴
		return changeName;
	}
}
