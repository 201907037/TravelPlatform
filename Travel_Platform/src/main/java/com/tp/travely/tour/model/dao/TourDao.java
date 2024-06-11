// �쑀吏� - tour �뙣�궎吏� �깮�꽦 (2024.06.10)
package com.tp.travely.tour.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.tp.travely.tour.model.vo.City;
import com.tp.travely.tour.model.vo.Tour;

@Repository
public class TourDao {

	// �쑀吏� - 愿�由ъ옄 �뿬�뻾吏� 紐⑸줉 議고쉶 DAO (2024.06.10)
	public ArrayList<Tour> adminTourList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("tourMapper.adminTourList");
	}
	
	public ArrayList<City> selectCity(SqlSessionTemplate sqlSession, int code){
		return (ArrayList)sqlSession.selectList("tourMapper.selectCity",code);
	}
}
