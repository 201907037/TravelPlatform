package com.tp.travely.planner.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.tp.travely.planner.model.vo.PlanDetail;
import com.tp.travely.planner.model.vo.Planner;

@Repository
public class PlannerDao {

	public int getTNOBycontentId(SqlSessionTemplate sqlSession, String contentId) {
		int id = Integer.parseInt(contentId);
		return sqlSession.selectOne("plannerMapper.getTNOBycontentId",id);
	}

	public int insertPlanner(SqlSessionTemplate sqlSession, Planner planner) {
		return sqlSession.insert("plannerMapper.insertPlanner",planner);
	}

	public int insertPlanDetail(SqlSessionTemplate sqlSession, PlanDetail p) {
		return sqlSession.insert("plannerMapper.insertPlanDetail",p);
	}

}
