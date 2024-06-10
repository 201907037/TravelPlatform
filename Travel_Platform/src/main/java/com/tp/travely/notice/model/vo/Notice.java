package com.tp.travely.notice.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 모든 필드를 매개변수로 갖는 생성자
@Setter // setter 메소드들
@Getter // getter 메소드들
@ToString // ToString 메소드 오버라이딩
public class Notice {

	// 공지사항 VO
	private int noticeNo;//	NOTICE_NO	NUMBER
	private String noticeTitle;//	NOTICE_TITLE	VARCHAR2(100 BYTE)
	private String noticeContent;//	NOTICE_CONTENT	VARCHAR2(300 BYTE)
	private String changeName;//	CHANGE_NAME	VARCHAR2(100 BYTE)
	private Date createDate;//	CREATE_DATE	DATE
	private String status;//	STATUS	CHAR(1 BYTE)
	
}
