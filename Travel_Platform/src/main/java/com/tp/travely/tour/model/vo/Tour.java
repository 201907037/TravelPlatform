// �쑀吏� - tour �뙣�궎吏� �깮�꽦 (2024.06.10)
package com.tp.travely.tour.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Tour {
	private int tourNo;
	private String tourName;
	private String address;
	private String addDate;
	private String contentId;
	private String thumbImg;
	private double mapX;
	private double mapY;
	private String tourType;
	private String status;
	private int refArea;
	private int refCity;
}