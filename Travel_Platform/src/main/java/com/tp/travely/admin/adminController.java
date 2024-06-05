package com.tp.travely.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class adminController {
	
	@GetMapping("adminPage.ad")
	public String adminPageView() {
		
		return "admin/adminPage";
	}

	
	
}
