package com.tp.travely.planner.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tp.travely.planner.model.dao.PlannerDao;

@Service
public class PlannerServiceImpl implements PlannerService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private PlannerDao plannerDao;
}
