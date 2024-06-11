// �쑀吏� - tour �뙣�궎吏� �깮�꽦 (2024.06.10)
package com.tp.travely.tour.model.service;

import java.util.ArrayList;

import com.tp.travely.tour.model.vo.City;
import com.tp.travely.tour.model.vo.Tour;

public interface TourService {

	// �쑀吏� - 愿�由ъ옄 �뿬�뻾吏� 紐⑸줉 議고쉶 (2024.06.10)
	ArrayList<Tour> adminTourList();
	
	// 김동현-2024.06.11
	ArrayList<City> selectCity(int code);
}
