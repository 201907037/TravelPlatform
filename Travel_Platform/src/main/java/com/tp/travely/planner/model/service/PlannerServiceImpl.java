package com.tp.travely.planner.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tp.travely.planner.model.dao.PlannerDao;
import com.tp.travely.planner.model.vo.PlanDetail;
import com.tp.travely.planner.model.vo.Planner;

@Service
public class PlannerServiceImpl implements PlannerService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private PlannerDao plannerDao;
	@Override
	public int getTNOBycontentId(String contentId) {
		return plannerDao.getTNOBycontentId(sqlSession,contentId);
	}
	@Override
	@Transactional
	public int insertPlanner(Planner planner,ArrayList<PlanDetail> list) {
		int rs = plannerDao.insertPlanner(sqlSession,planner);
		for(PlanDetail p :list) { 
			//System.out.println(p);
			rs *= plannerDao.insertPlanDetail(sqlSession,p);
		}
		return rs;
	}
	@Override
	public Planner getPlannerByPNO(int pno) {
		return plannerDao.getPlannerByPNO(sqlSession,pno);
	}
	
}
