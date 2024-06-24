// 유진 - tour 패키지 생성 (2024.06.10)
package com.tp.travely.tour.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tp.travely.member.model.vo.Member;
import com.tp.travely.tour.model.dao.TourDao;
import com.tp.travely.tour.model.vo.City;
import com.tp.travely.tour.model.vo.Districts;
import com.tp.travely.tour.model.vo.LeportsData;
import com.tp.travely.tour.model.vo.LodgingData;
import com.tp.travely.tour.model.vo.RestaurantData;
import com.tp.travely.tour.model.vo.Tour;
import com.tp.travely.tour.model.vo.TourImg;
import com.tp.travely.tour.model.vo.TourReview;
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
		// LodgingData 저장
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
		// RestaurantData 저장
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
		// LeportsData 저장
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
		return tourDao.tourSpotDetail(sqlSession, tourNo);
	}

	@Override
	public LodgingData lodgingDetail(int tourNo) {
		return tourDao.lodgingDetail(sqlSession, tourNo);
	}

	@Override
	public RestaurantData restaurantDetail(int tourNo) {
		return tourDao.restaurantDetail(sqlSession, tourNo);
	}

	@Override
	public LeportsData leportsDetail(int tourNo) {
		return tourDao.leportsDetail(sqlSession, tourNo);
	}
	
	@Override
	public ArrayList<TourImg> tourImgList(int tourNo) {
		return tourDao.tourImgList(sqlSession, tourNo);
	}
	
	// 유진 - 관리자 여행지 조회 서비스 (Tour 객체에서만) (2024.06.19)
	@Override
	public Tour getTourByNo(int tourNo) {
        return tourDao.findTourByNo(sqlSession, tourNo);
    }

	// 유진 - 관리자 여행지 삭제 서비스 (2024.06.17)
	@Override
	@Transactional
	public int deleteTour(int tourNo) {
		return tourDao.deleteTour(sqlSession, tourNo);
	}
	
	@Override
	public ArrayList<TourReview> reviewList(int tourNo) {
		return tourDao.reviewList(sqlSession, tourNo);
	}

	@Override
	public ArrayList<Member> reviewMemberList(int tourNo) {
		// TODO Auto-generated method stub
		return tourDao.reviewMemberList(sqlSession, tourNo);
	}

	@Override
	@Transactional
	public int reviewDelete(int reviewNo) {
		return tourDao.reviewDelete(sqlSession, reviewNo);
	}

	// 유진 - 관리자 여행지 추가이미지 파일들 조회 서비스 (2024.06.24)
	@Override
	public ArrayList<TourImg> getTourImgsByTourNo(int tourNo) {
		return tourDao.getTourImgsByTourNo(sqlSession, tourNo);
	}

	// 유진 - 관리자 여행지 수정 서비스 (2024.06.24)
	@Override
	@Transactional
	public int updateTour(Tour tour) {
		return tourDao.updateTour(sqlSession, tour);
	}
	
	@Override
	@Transactional
	public int updateTour(TourSpotData tsd, ArrayList<TourImg> updatedTourImgs) {
		// TourSpotDatas 저장
	    int result = tourDao.updateTour(sqlSession, tsd);

	    // TourImg 리스트 저장
	    for (TourImg tourImg : updatedTourImgs) {
	        result += tourDao.updateTourImg(sqlSession, tourImg); // 각각의 TourImg 저장
	    }
	    
	    return result;
	}

	@Override
	@Transactional
	public int updateTour(LodgingData lod, ArrayList<TourImg> updatedTourImgs) {
		// LodgingData 저장
	    int result = tourDao.updateTour(sqlSession, lod);

	    // TourImg 리스트 저장
	    for (TourImg tourImg : updatedTourImgs) {
	        result += tourDao.updateTourImg(sqlSession, tourImg); // 각각의 TourImg 저장
	    }
	    
	    return result;
	}

	@Override
	@Transactional
	public int updateTour(RestaurantData rd, ArrayList<TourImg> updatedTourImgs) {
		// RestaurantData 저장
	    int result = tourDao.updateTour(sqlSession, rd);
	    
	    // TourImg 리스트 저장
	    for (TourImg tourImg : updatedTourImgs) {
	        result += tourDao.updateTourImg(sqlSession, tourImg); // 각각의 TourImg 저장
	    }
	    
	    return result;
	}

	@Override
	@Transactional
	public int updateTour(LeportsData led, ArrayList<TourImg> updatedTourImgs) {
		// LeportsData 저장
	    int result = tourDao.updateTour(sqlSession, led);

	    // TourImg 리스트 저장
	    for (TourImg tourImg : updatedTourImgs) {
	        result += tourDao.updateTourImg(sqlSession, tourImg); // 각각의 TourImg 저장
	    }
	    
	    return result;
	}
}
