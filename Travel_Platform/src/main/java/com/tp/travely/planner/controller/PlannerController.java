package com.tp.travely.planner.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@PostMapping(value="savePlanner.pl", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String savePlanner(@RequestBody String jsonData) {
		System.out.println(jsonData);
		JsonObject totalObj = JsonParser.parseString(jsonData).getAsJsonObject();
		JsonObject planObj = totalObj.getAsJsonObject("plan");
		JsonArray planArr = planObj.getAsJsonArray("planList");
		
		String name = totalObj.get("title").getAsString();
		String exp = totalObj.get("exp").getAsString();
		String startD = planObj.get("startDate").getAsString().substring(0,10);
		String endD = planObj.get("endDate").getAsString().substring(0,10);
		
		Planner planner = new Planner();
		planner.setPlanName(name);
		planner.setPlanExp(exp);
		planner.setStartDate(startD);
		planner.setEndDate(endD);
		
		ArrayList<PlanDetail> detailList = new ArrayList<PlanDetail>();
		for(int i = 0;i<planArr.size();i++) {
			JsonObject item = planArr.get(i).getAsJsonObject();
			JsonArray tourArr = item.getAsJsonArray("tourList");
			System.out.println(tourArr);
			for(int j=0;j<tourArr.size();j++) {
				PlanDetail pDetail = new PlanDetail();
				pDetail.setStartTime(item.get("date").getAsString().substring(0, 10));
				pDetail.setStartTime(item.get("startTimeH").getAsString()+":"+item.get("startTimeM").getAsString());
				pDetail.setEndTime(item.get("endTimeH").getAsString()+":"+item.get("endTimeM").getAsString());
				pDetail.setDayCount(item.get("dayCount").getAsInt());
				pDetail.setRefTno(tourArr.get(j).getAsJsonObject().get("tno").getAsInt());
				pDetail.setTime(tourArr.get(j).getAsJsonObject().get("time").getAsString());	
				detailList.add(pDetail);
			}
		}
		System.out.println(planner);
		for(PlanDetail p : detailList) {
			System.out.println(p);
		}
		//System.out.println(totalObj.get("startDate"));
		return jsonData;
	}
}
