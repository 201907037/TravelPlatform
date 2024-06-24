// 유진 - 관리자 여행지 추가 기능을 위한 TourSpot 클래스의 새 VO 가공
package com.tp.travely.tour.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class TourSpotData {
	private String tourName;
	private String tourtype;
	private String address;
	private String addDate;
	private String thumbImg;
	private String contentId;
	private double mapX;
	private double mapY;
	
	private int spotNo;
	private String season;
	private String useTime;
	private String tel;
	private String pet;
	private int refTno;
}
