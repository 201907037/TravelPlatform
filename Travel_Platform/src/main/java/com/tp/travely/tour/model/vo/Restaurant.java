// 유진 - Restaurant 객체 추가 생성 (2024.06.11)
package com.tp.travely.tour.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Restaurant {
	private int rdNo;
	private String kidRoom;
	private String firstMenu;
	private String treatMenu;
	private String tel;
	private String openTime;
	private String restDate;
	private int refTno;
}
