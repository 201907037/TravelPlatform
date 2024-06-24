package com.tp.travely.planner.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Planner {
	private int planNo;
	private String planName;
	private String planExp;
	private String startDate;
	private String endDate;
	private String changeName;
	private String plStatus;
	private String createDate;
	private int areaCode;
	private int sigunguCodeNo;
	private int count;
	private String status;
	private int refUno;
}
