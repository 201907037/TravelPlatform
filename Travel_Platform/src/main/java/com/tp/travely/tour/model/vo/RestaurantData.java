// 유진 - 관리자 여행지 추가 기능을 위한 Restaurant 클래스의 새 VO 가공
package com.tp.travely.tour.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class RestaurantData {
	private String tourName;
	private String tourtype;
	private String address;
	private String addDate;
	private String thumbImg;
	private String contentId;
	private double mapX;
	private double mapY;
	
	private String kidRoom;
	private String firstMenu;
	private String treatMenu;
	private String tel;
	private String openTime;
	private String restDate;
	private int rdNo; // 추가
	private int refTno;// 추가
}
