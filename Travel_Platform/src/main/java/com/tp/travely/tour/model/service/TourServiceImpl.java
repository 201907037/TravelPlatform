// 유진 - tour 패키지 생성 (2024.06.10)
package com.tp.travely.tour.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tp.travely.tour.model.dao.TourDao;
import com.tp.travely.tour.model.vo.City;
import com.tp.travely.tour.model.vo.Districts;
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
	// 김동현 - 2024.06.16
	// 여행지 리스트 조회
	@Override
	public int selectTourListCount(Map<String, String> map) {
		return tourDao.selectTourListCount(sqlSession,map);
	}
	
	@Override
	public ArrayList<Tour> selectTourList(Map<String, String> map) {
		return tourDao.selectTourList(sqlSession,map);
	}
	
	@Override
	public int searchTourListCount(Map<String, String> map) {
		return tourDao.searchTourListCount(sqlSession, map);
	}
	
	@Override
	public ArrayList<Tour> selectSearchList(Map<String, String> map) {
		return tourDao.selectSearchList(sqlSession,map);
	}

	// 유진 - 관리자 여행지 추가 서비스  (2024.06.12)
	@Override
	@Transactional
	public int insertTour(TourSpotData tsd, ArrayList<TourImg> tourImgList) {	
		// TourSpotData 저장
	    int result = tourDao.insertTour(sqlSession, tsd);

	    // TourImg 리스트 저장
	    for (TourImg tourImg : tourImgList) {
	        result += tourDao.insertTourImg(sqlSession, tourImg); // 각각의 TourImg 저장
	    }
	    return result;
	}
	
	@Override
	@Transactional
	public int insertTour(LodgingData lod, ArrayList<TourImg> tourImgList) {
		// TourSpotData 저장
	    int result = tourDao.insertTour(sqlSession, lod);

	    // TourImg 리스트 저장
	    for (TourImg tourImg : tourImgList) {
	        result += tourDao.insertTourImg(sqlSession, tourImg); // 각각의 TourImg 저장
	    }
	    return result;
	}
	
	@Override
	@Transactional
	public int insertTour(RestaurantData rd, ArrayList<TourImg> tourImgList) {
		// TourSpotData 저장
	    int result = tourDao.insertTour(sqlSession, rd);

	    // TourImg 리스트 저장
	    for (TourImg tourImg : tourImgList) {
	        result += tourDao.insertTourImg(sqlSession, tourImg); // 각각의 TourImg 저장
	    }
	    return result;
	}
	
	@Override
	@Transactional
	public int insertTour(LeportsData led, ArrayList<TourImg> tourImgList) {
		// TourSpotData 저장
	    int result = tourDao.insertTour(sqlSession, led);

	    // TourImg 리스트 저장
	    for (TourImg tourImg : tourImgList) {
	        result += tourDao.insertTourImg(sqlSession, tourImg); // 각각의 TourImg 저장
	    }
	    return result;
	}

	// 김동현
	@Override
	public City getLocationCity(int sigunguCodeNo) {
		return tourDao.getLocationCity(sqlSession,sigunguCodeNo);
	}

	@Override
	public Districts getLocationArea(int areaCode) {
		return tourDao.getLocationArea(sqlSession,areaCode);
	}

	// 유진&현성 - 관리자 여행지 상세조회 서비스 (2024.06.14)
	@Override
	public TourSpotData tourSpotDetail(int tourNo) {
		System.out.println("관광지 서비스 넘어옴");
		return tourDao.tourSpotDetail(sqlSession, tourNo);
	}

	@Override
	public LodgingData lodgingDetail(int tourNo) {
		System.out.println("숙박시설 서비스 넘어옴");
		return tourDao.lodgingDetail(sqlSession, tourNo);
	}

	@Override
	public RestaurantData restaurantDetail(int tourNo) {
		System.out.println("레스토랑 서비스 넘어옴");
		return tourDao.restaurantDetail(sqlSession, tourNo);
	}

	@Override
	public LeportsData leportsDetail(int tourNo) {
		System.out.println("레포츠 서비스 넘어옴");
		return tourDao.leportsDetail(sqlSession, tourNo);
	}
	
	@Override
	public ArrayList<TourImg> tourImgList(int tourNo) {
		System.out.println("추가이미지 서비스 넘어옴");
		return tourDao.tourImgList(sqlSession, tourNo);
	}
	
	// 유진 - 관리자 여행지 조회 서비스 (Tour 객체에서만) (2024.06.19)
	@Override
	public Tour getTourByNo(int tourNo) {
		System.out.println("공통 Tour 객체 서비스 넘어옴");
        return tourDao.findTourByNo(sqlSession, tourNo);
    }

	// 유진 - 관리자 여행지 삭제 서비스 (2024.06.17)
	@Override
	@Transactional
	public int deleteTour(int tourNo) {
		return tourDao.deleteTour(sqlSession, tourNo);
	}
}
