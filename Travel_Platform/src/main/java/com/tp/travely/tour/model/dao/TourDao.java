// 유진 - tour 패키지 생성 (2024.06.10)
package com.tp.travely.tour.model.dao;

import java.util.ArrayList;
import java.util.Map;

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
	
	// 김동현
	public ArrayList<City> selectCity(SqlSessionTemplate sqlSession, int code){
		return (ArrayList)sqlSession.selectList("tourMapper.selectCity",code);
	}
	// 김동현 - 2024.06.16
	// 여행지 리스트 조회
	public int selectTourListCount(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("tourMapper.selectTourListCount",map);
	}
	public ArrayList<Tour> selectTourList(SqlSessionTemplate sqlSession, Map<String,String> map){
		return (ArrayList)sqlSession.selectList("tourMapper.selectTourList",map);
	}

	
	// 유진 - 관리자 여행지 추가 DAO (2024.06.12)
	public int insertTourImg(SqlSessionTemplate sqlSession, TourImg tourImg) {
	    return sqlSession.insert("tourMapper.insertTourImg", tourImg);
	}
	
	public int insertTour(SqlSessionTemplate sqlSession, TourSpotData tsd) {
        System.out.println("TourSpotData");
        return sqlSession.insert("tourMapper.insertTourSpotData", tsd);
	}

	public int insertTour(SqlSessionTemplate sqlSession, LodgingData lod) {
		System.out.println("LodgingData");
        return sqlSession.insert("tourMapper.insertLodgingData", lod);
	}

	public int insertTour(SqlSessionTemplate sqlSession, RestaurantData rd) {
		System.out.println("RestaurantData");
        return sqlSession.insert("tourMapper.insertRestaurantData", rd);
	}

	public int insertTour(SqlSessionTemplate sqlSession, LeportsData led) {
		System.out.println("LeportsData");
		return sqlSession.insert("tourMapper.insertLeportsData", led);
	}
	
	
	public City getLocationCity(SqlSessionTemplate sqlSession, int sigunguCodeNo) {
		return sqlSession.selectOne("tourMapper.getLocationCity",sigunguCodeNo);
	}
	
	public Districts getLocationArea(SqlSessionTemplate sqlSession, int areaCode) {
		return sqlSession.selectOne("tourMapper.getLocationArea",areaCode);
	}

	
	// 유진&현성 - 관리자 여행지 상세조회 DAO (2024.06.14)
	public TourSpotData tourSpotDetail(SqlSessionTemplate sqlSession, int tourNo) {
		return sqlSession.selectOne("tourMapper.tourSpotDetail", tourNo);
	}

	public LodgingData lodgingDetail(SqlSessionTemplate sqlSession, int tourNo) {
		return sqlSession.selectOne("tourMapper.lodgingDetail", tourNo);
	}

	public RestaurantData restaurantDetail(SqlSessionTemplate sqlSession, int tourNo) {
		return sqlSession.selectOne("tourMapper.restaurantDetail", tourNo);
	}

	public LeportsData leportsDetail(SqlSessionTemplate sqlSession, int tourNo) {
		return sqlSession.selectOne("tourMapper.leportsDetail", tourNo);
	}

	public ArrayList<TourImg> tourImgList(SqlSessionTemplate sqlSession, int tourNo) {
		return (ArrayList)sqlSession.selectList("tourMapper.tourImgList", tourNo);
	}
	
	// 유진 - 관리자 여행지 조회 DAO (Tour 객체에서만) (2024.06.19)
	public Tour findTourByNo(SqlSessionTemplate sqlSession, int tourNo) {
        return sqlSession.selectOne("getTourByNo", tourNo);
    }
	
	// 유진 - 관리자 여행지 삭제 DAO (2024.06.17)
	public int deleteTour(SqlSessionTemplate sqlSession, int tourNo) {
		return sqlSession.update("tourMapper.deleteTour", tourNo);
	}
}
