package com.tp.travely.planner.model.vo;

import lombok.Data;

@Data
public class PlanReply {
	private int prNo;
	private String prContent;
	private int refPno;
	private int refUno;
	private String createDate;
	private String nickName;
}
