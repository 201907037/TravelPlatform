package com.tp.travely.planner.model.service;

import java.util.ArrayList;

import com.tp.travely.planner.model.vo.PlanDetail;
import com.tp.travely.planner.model.vo.Planner;

public interface PlannerService {

	int getTNOBycontentId(String contentId);
	int insertPlanner(Planner planner,ArrayList<PlanDetail> list);
	Planner getPlannerByPNO(int pno);
}
