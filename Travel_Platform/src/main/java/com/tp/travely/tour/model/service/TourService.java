// 유진 - tour 패키지 생성 (2024.06.10)
package com.tp.travely.tour.model.service;

import java.util.ArrayList;

import com.tp.travely.tour.model.vo.City;
import com.tp.travely.tour.model.vo.Districts;
import com.tp.travely.tour.model.vo.LeportsData;
import com.tp.travely.tour.model.vo.LodgingData;
import com.tp.travely.tour.model.vo.RestaurantData;
import com.tp.travely.tour.model.vo.Tour;
import com.tp.travely.tour.model.vo.TourImg;
import com.tp.travely.tour.model.vo.TourSpotData;

public interface TourService {

	// 유진 - 관리자 여행지 목록 조회 서비스 (2024.06.10)
	ArrayList<Tour> adminTourList();
	
	// 김동현-2024.06.11
	ArrayList<City> selectCity(int code);

	// 유진 - 관리자 여행지 추가 서비스 (2024.06.12)
	int insertTour(TourSpotData tsd, TourImg ti);
	int insertTour(LodgingData lod, TourImg ti);
	int insertTour(RestaurantData rd, TourImg ti);
	int insertTour(LeportsData led, TourImg ti);
	
	City getLocationCity(int sigunguCodeNo);
	
	Districts getLocationArea(int areaCode);

	// 유진&현성 - 관리자 여행지 상세조회 서비스 (2024.06.14)
	TourSpotData tourSpotDetail(int tourNo);
	LodgingData lodgingDetail(int tourNo);
	RestaurantData restaurantDetail(int tourNo);
	LeportsData leportsDetail(int tourNo);
}
