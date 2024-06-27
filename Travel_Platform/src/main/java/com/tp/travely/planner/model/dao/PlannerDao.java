package com.tp.travely.planner.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.tp.travely.planner.model.vo.PlanDetail;
import com.tp.travely.planner.model.vo.PlanReply;
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

	public ArrayList<Planner> searchPlanList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("plannerMapper.searchPlanList", map);
	}

	public String getTourTypeByContentId(SqlSessionTemplate sqlSession, String contentId) {
		return sqlSession.selectOne("plannerMapper.getTourTypeByContentId",contentId);
	}

	public ArrayList<PlanDetail> getDetail(SqlSessionTemplate sqlSession, int pno) {
		return (ArrayList)sqlSession.selectList("plannerMapper.getDetail",pno);
	}

	public int addReply(SqlSessionTemplate sqlSession, PlanReply pr) {
		return sqlSession.insert("plannerMapper.addReply",pr);
	}

	public ArrayList<PlanReply> getReply(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("plannerMapper.getReply",map);
	}

	public int selectReplyCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("plannerMapper.selectReplyCount",map);
	}

	public int getMyPlannerCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("plannerMapper.getMyPlannerCount",map);
	}

	public ArrayList<Planner> getMyPlannerList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("plannerMapper.getMyPlannerList",map);
	}

	public int updatePlanner(SqlSessionTemplate sqlSession, Planner planner) {
		return sqlSession.update("plannerMapper.updatePlanner",planner);
	}

	public int insertPlanDetailwithUpdate(SqlSessionTemplate sqlSession, PlanDetail pd) {
		return sqlSession.insert("plannerMapper.insertPlanDetailwithUpdate", pd);
	}

	public int updatePlanDetail(SqlSessionTemplate sqlSession, PlanDetail pd) {
		return sqlSession.update("plannerMapper.updatePlanDetail",pd);
	}

	public int addCount(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.update("plannerMapper.addCount",pno);
	}

	

}
