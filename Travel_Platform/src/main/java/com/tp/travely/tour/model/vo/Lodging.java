// 유진 - Lodging 객체 추가 생성 (2024.06.11)
package com.tp.travely.tour.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Lodging {
	private int lNo;
	private String roomType;
	private String checkIn;
	private String checkOut;
	private String cook;
	private String tel;
	private String parking;
	private int refTno;
}
