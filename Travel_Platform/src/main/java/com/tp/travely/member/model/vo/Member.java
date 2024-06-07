package com.tp.travely.member.model.vo;

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
public class Member {
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String nickName;
	private String name;
	private int age;
	private String email;
	private String phone;
	private String address;
	private String gender;
	private String changeName;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
	
	
	
	
	
}
