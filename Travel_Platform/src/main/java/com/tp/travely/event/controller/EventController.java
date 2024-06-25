package com.tp.travely.event.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tp.travely.common.model.vo.PageInfo;
import com.tp.travely.common.template.Pagination;
import com.tp.travely.event.model.vo.Festival;

@Controller
public class EventController {
	
	@GetMapping("eventList.bo")
	public String eventList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		Date today = new Date();
		SimpleDateFormat ttday = new SimpleDateFormat("yyyyMMdd");
		
		System.out.println(ttday.format(today));
		
		ArrayList<Festival> list = new EventApi().eventCall(currentPage, ttday.format(today));
		
		System.out.println(list);
		
		int listCount = list.get(0).getTotalCount();
		int pageLimit = 10;
		int boardLimit = 12;
		
		PageInfo pi 
		= Pagination.getPageInfo(listCount, 
							 	 currentPage, 
							 	 pageLimit, 
							 	 boardLimit);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
//		System.out.println(pi);
//		System.out.println(list);
		
		return "event/eventListView";
	}
}