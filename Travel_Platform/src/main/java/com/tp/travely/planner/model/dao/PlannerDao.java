package com.tp.travely.planner.model.dao;

import java.util.ArrayList;
import java.util.Map;

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

	public Planner getPlannerByPNO(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("plannerMapper.getPlannerByPNO",pno);
	}

	public int checkTour(SqlSessionTemplate sqlSession, int contentId) {
		return sqlSession.selectOne("plannerMapper.checkTour",contentId);
	}

	public int selectPlanListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("plannerMapper.selectPlanListCount");
	}

	public ArrayList<Planner> selectPlanList(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return (ArrayList)sqlSession.selectList("plannerMapper.selectPlanList",map);
	}

	public int searchPlanCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("plannerMapper.searchPlanCount",keyword);
	}

}
