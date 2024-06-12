// 유진 - tour 패키지 생성 (2024.06.10)
package com.tp.travely.tour.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.tp.travely.tour.model.vo.City;
import com.tp.travely.tour.model.vo.Tour;

@Repository
public class TourDao {

	// 유진 - 관리자 여행지 목록 조회 DAO (2024.06.10)
	public ArrayList<Tour> adminTourList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("tourMapper.adminTourList");
	}
	
	public ArrayList<City> selectCity(SqlSessionTemplate sqlSession, int code){
		return (ArrayList)sqlSession.selectList("tourMapper.selectCity",code);
	}
}
