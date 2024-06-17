// 유진 - tour 패키지 생성 (2024.06.10)
package com.tp.travely.tour.model.service;

import java.util.ArrayList;
import java.util.Map;

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
	
	// 김동현 - 2024.06.11
	// 김동현 - 2024.06.16
	ArrayList<City> selectCity(int code);
	int selectTourListCount(Map<String, String> map);
	ArrayList<Tour> selectTourList(Map<String,String> map);

	// 유진 - 관리자 여행지 추가 서비스 (2024.06.12)
	int insertTour(TourSpotData tsd, ArrayList<TourImg> tourImgList);
	int insertTour(LodgingData lod, ArrayList<TourImg> tourImgList);
	int insertTour(RestaurantData rd, ArrayList<TourImg> tourImgList);
	int insertTour(LeportsData led, ArrayList<TourImg> tourImgList);
	
	City getLocationCity(int sigunguCodeNo);
	
	Districts getLocationArea(int areaCode);

	// 유진&현성 - 관리자 여행지 상세조회 서비스 (2024.06.14)
	TourSpotData tourSpotDetail(int tourNo);
	LodgingData lodgingDetail(int tourNo);
	RestaurantData restaurantDetail(int tourNo);
	LeportsData leportsDetail(int tourNo);
	// 이미지 list
	ArrayList<TourImg> tourImgList(int tourNo);

	// 유진 - 관리자 여행지 삭제 서비스 (2024.06.17)
	int deleteTour(int tourNo);
}
