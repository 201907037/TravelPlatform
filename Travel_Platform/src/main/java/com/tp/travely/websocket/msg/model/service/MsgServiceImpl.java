package com.tp.travely.websocket.msg.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tp.travely.member.model.vo.Member;
import com.tp.travely.websocket.msg.model.dao.MsgDao;
import com.tp.travely.websocket.msg.model.vo.Msg;

@Service
public class MsgServiceImpl implements MsgService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MsgDao msgDao;

	@Transactional
	@Override
	public int insertMsg(Msg m) {
		
		return MsgDao.insertMsg(sqlSession, m);
	}

	
}
