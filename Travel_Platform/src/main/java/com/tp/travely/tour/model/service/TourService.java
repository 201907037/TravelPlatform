// 유진 - tour 패키지 생성 (2024.06.10)
package com.tp.travely.tour.model.service;

import java.util.ArrayList;

import com.tp.travely.tour.model.vo.City;
import com.tp.travely.tour.model.vo.Tour;

public interface TourService {

	// 유진 - 관리자 여행지 목록 조회 서비스 (2024.06.10)
	ArrayList<Tour> adminTourList();
	
	// 김동현-2024.06.11
	ArrayList<City> selectCity(int code);
}
