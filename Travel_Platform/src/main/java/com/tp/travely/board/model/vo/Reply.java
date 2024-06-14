package com.tp.travely.board.model.vo;

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
public class Reply {

	
	
	
	private long replyNo;
	private String replyContent;
	private String createDate;
	private String modifyDate;
	private String userNo;
	private String boardNo;
	private String status;
	
	
}
