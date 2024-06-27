package com.tp.travely.planner.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tp.travely.planner.model.dao.PlannerDao;
import com.tp.travely.planner.model.vo.PlanDetail;
import com.tp.travely.planner.model.vo.PlanReply;
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
	@Override
	public int checkTour(int contentId) {
		return plannerDao.checkTour(sqlSession,contentId);
	}
	@Override
	public int selectPlanListCount() {
		return plannerDao.selectPlanListCount(sqlSession);
	}
	@Override
	public ArrayList<Planner> selectPlanList(Map<String, String> map) {
		return plannerDao.selectPlanList(sqlSession,map);
	}
	@Override
	public int searchPlanCount(String keyword) {
		return plannerDao.searchPlanCount(sqlSession,keyword);
	}
	@Override
	public ArrayList<Planner> searchPlanList(HashMap<String, String> map) {
		return plannerDao.searchPlanList(sqlSession,map);
	}
	@Override
	public String getTourTypeByContentId(String contentId) {
		return plannerDao.getTourTypeByContentId(sqlSession,contentId);
	}
	@Override
	public ArrayList<PlanDetail> getDetail(int pno) {
		return plannerDao.getDetail(sqlSession,pno);
	}
	@Override
	public int addReply(PlanReply pr) {
		return plannerDao.addReply(sqlSession,pr);
	}
	@Override
	public ArrayList<PlanReply> getReply(HashMap<String, String> map) {
		return plannerDao.getReply(sqlSession,map);
	}
	@Override
	public int selectReplyCount(HashMap<String, String> map) {
		return plannerDao.selectReplyCount(sqlSession,map);
	}
	@Override
	public int getMyPlannerCount(HashMap<String, String> map) {
		return plannerDao.getMyPlannerCount(sqlSession,map);
	}
	@Override
	public ArrayList<Planner> getMyPlannerList(HashMap<String, String> map) {
		return plannerDao.getMyPlannerList(sqlSession,map);
	}
	@Override
	@Transactional
	public int updatePlanner(Planner planner, ArrayList<PlanDetail> detailList) {
		int rs = plannerDao.updatePlanner(sqlSession, planner);
		for(PlanDetail pd : detailList) {
			if(pd.getDetailNo()==0) {
				rs*=plannerDao.insertPlanDetailwithUpdate(sqlSession,pd);
			}else {
				rs*=plannerDao.updatePlanDetail(sqlSession,pd);
			}
		}
		return rs;
	}
	@Override
	@Transactional
	public int addCount(int pno) {
		return plannerDao.addCount(sqlSession,pno);
	}
	
	
	
	
}
