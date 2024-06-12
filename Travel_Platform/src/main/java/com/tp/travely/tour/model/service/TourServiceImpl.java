// 유진 - tour 패키지 생성 (2024.06.10)
package com.tp.travely.tour.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tp.travely.tour.model.dao.TourDao;
import com.tp.travely.tour.model.vo.City;
import com.tp.travely.tour.model.vo.LeportsData;
import com.tp.travely.tour.model.vo.LodgingData;
import com.tp.travely.tour.model.vo.RestaurantData;
import com.tp.travely.tour.model.vo.Tour;
import com.tp.travely.tour.model.vo.TourImg;
import com.tp.travely.tour.model.vo.TourSpotData;

@Service
public class TourServiceImpl implements TourService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private TourDao tourDao;
	
	// 유진 - 관리자 여행지 목록 조회 서비스 (2024.06.10)
	@Override
	public ArrayList<Tour> adminTourList() {
		return tourDao.adminTourList(sqlSession);
	}
	
	// 김동현 2024.06.11
	@Override
	public ArrayList<City> selectCity(int code) {
		ArrayList<City> list = tourDao.selectCity(sqlSession,code);
		return list;
	}

	// 유진 - 관리자 여행지 추가 서비스  (2024.06.12)
	@Override
	@Transactional
	public int insertTour(TourSpotData tsd, LodgingData lod, RestaurantData rd, LeportsData led, TourImg ti) {
		return tourDao.insertTour(sqlSession, tsd, lod, rd, led, ti);
	}

}
