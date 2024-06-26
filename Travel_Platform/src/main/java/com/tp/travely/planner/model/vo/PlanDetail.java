package com.tp.travely.planner.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PlanDetail {
	private int detailNo;
	private String startTime;
	private String endTime;
	private String planDate;
	private String time;
	private int dayCount;
	private int refTno;
	private int refPno;
	private String tourName;
	private double mapX;
	private double mapY;
}
