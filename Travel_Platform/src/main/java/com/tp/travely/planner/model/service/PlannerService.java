package com.tp.travely.planner.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.tp.travely.planner.model.vo.PlanDetail;
import com.tp.travely.planner.model.vo.PlanReply;
import com.tp.travely.planner.model.vo.Planner;

public interface PlannerService {

	int getTNOBycontentId(String contentId);
	int insertPlanner(Planner planner,ArrayList<PlanDetail> list);
	Planner getPlannerByPNO(int pno);
	int checkTour(int contentId);
	int selectPlanListCount();
	ArrayList<Planner> selectPlanList(Map<String, String> map);
	int searchPlanCount(String keyword);
	ArrayList<Planner> searchPlanList(HashMap<String, String> map);
	String getTourTypeByContentId(String contentId);
	ArrayList<PlanDetail> getDetail(int pno);
	int addReply(PlanReply pr);
	ArrayList<PlanReply> getReply(HashMap<String, String> map);
	int selectReplyCount(HashMap<String, String> map);
	int getMyPlannerCount(HashMap<String, String> map);
	ArrayList<Planner> getMyPlannerList(HashMap<String, String> map);
}
