package com.tp.travely.tour.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class TourReview {

	private int reviewNo;//	R_NO	NUMBER
	private String reviewTitle;//	R_TITLE	VARCHAR2(100 BYTE)
	private String reviewContent;//	R_CONTENT	VARCHAR2(100 BYTE)
	private Date createDate;//	CREATE_DATE	DATE
	private double score;//	SCORE	NUMBER
	private String status;
	private int tourNo;//	TOUR_NO	NUMBER
	private int userNo;//	USER_NO	NUMBER
	private String nickName; // resultMap에서 사용할 변수
	
}