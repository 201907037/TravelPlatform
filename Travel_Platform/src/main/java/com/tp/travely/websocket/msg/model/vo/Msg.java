package com.tp.travely.websocket.msg.model.vo;

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
public class Msg {

//	MSG_NO	NUMBER
//	MSG_CONTENT	VARCHAR2(600 BYTE)
//	MSG_TIME	DATE
//	USER_NO	NUMBER
	
	private int msgNo;
	private String msgContent;
	private String msgTime;
	private String nickName;
	private String changeName;
	private int age;
	private String gender;
	private int userNo;

}
