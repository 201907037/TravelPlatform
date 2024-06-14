package com.tp.travely.event.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Festival {

	private String areacode; // 지역코드
	private String addr1; // 주소
	private String eventstartdate; // 행사시작일
	private String eventenddate; // 행사종료일
	private String title; // 행사제목
	private String firstimage; // 대표이미지
	private String firstimage2; // 썸네일
	private int totalCount; // 총 개수
	
}