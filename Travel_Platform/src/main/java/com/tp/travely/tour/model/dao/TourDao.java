// 유진 - tour 패키지 생성 (2024.06.10)
package com.tp.travely.tour.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.tp.travely.tour.model.vo.City;
import com.tp.travely.tour.model.vo.Districts;
import com.tp.travely.tour.model.vo.LeportsData;
import com.tp.travely.tour.model.vo.LodgingData;
import com.tp.travely.tour.model.vo.RestaurantData;
import com.tp.travely.tour.model.vo.Tour;
import com.tp.travely.tour.model.vo.TourImg;
import com.tp.travely.tour.model.vo.TourSpotData;

@Repository
public class TourDao {

	// 유진 - 관리자 여행지 목록 조회 DAO (2024.06.10)
	public ArrayList<Tour> adminTourList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("tourMapper.adminTourList");
	}
	
	public ArrayList<City> selectCity(SqlSessionTemplate sqlSession, int code){
		return (ArrayList)sqlSession.selectList("tourMapper.selectCity",code);
	}

	// 유진 - 관리자 여행지 추가 DAO (2024.06.12)
	public int insertTour(SqlSessionTemplate sqlSession, TourSpotData tsd, LodgingData lod, 
            			  RestaurantData rd, LeportsData led, TourImg ti) {
		int result = 0;
		
		result += sqlSession.insert("tourMapper.insertTourSpotData", tsd);
		result += sqlSession.insert("tourMapper.insertLodgingData", lod);
		result += sqlSession.insert("tourMapper.insertRestaurantData", rd);
		result += sqlSession.insert("tourMapper.insertLeportsData", led);
		result += sqlSession.insert("tourMapper.insertTourImg", ti);
		
		return result;
	}
	
	public City getLocationCity(SqlSessionTemplate sqlSession, int sigunguCodeNo) {
		return sqlSession.selectOne("tourMapper.getLocationCity",sigunguCodeNo);
	}
	
	public Districts getLocationArea(SqlSessionTemplate sqlSession, int areaCode) {
		return sqlSession.selectOne("tourMapper.getLocationArea",areaCode);
	}
}
