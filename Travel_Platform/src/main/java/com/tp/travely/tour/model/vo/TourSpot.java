// 유진 - TourSpot 객체 추가 생성 (2024.06.11)
package com.tp.travely.tour.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class TourSpot {
	private int spotNo;
	private String season;
	private String useTime;
	private String tel;
	private String pet;
	private int refTno;
}
