package com.tp.travely.websocket.msg.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.tp.travely.member.model.vo.Member;
import com.tp.travely.websocket.msg.model.vo.Msg;

@Component
public class MsgDao {

	// 채팅관련해서 DB까지 많이 안다녀오기때문에 이전에 내가 작업하던 boardMapper 에서 작업할 것임
	public static int insertMsg(SqlSessionTemplate sqlSession, Msg m) {
		
		return sqlSession.insert("boardMapper.insertMsg", m);
	}

	
	
	

}
