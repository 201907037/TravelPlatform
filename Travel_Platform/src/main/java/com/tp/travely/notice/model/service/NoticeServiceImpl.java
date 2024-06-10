package com.tp.travely.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tp.travely.notice.model.dao.NoticeDao;
import com.tp.travely.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 공지사항 리스트뷰 Service
	@Override
	public ArrayList<Notice> adminNoticeListView() {
	
		return noticeDao.adminNoticeListView(sqlSession);
	}

	// 공지사항 isnert Service
	@Override
	public int insertNotice(Notice n) {
		
		return noticeDao.insertNotice(sqlSession, n);
	}

	// 공지사항 삭제 Service
	@Override
	public int deleteNotice(int num) {
		return noticeDao.deleteNotice(sqlSession, num);
	}

	// 공지사항 상세보기 Service(작업중)
	@Override
	public Notice detailNotice(int num) {
		return noticeDao.detailNotice(sqlSession, num);
	}

	// 공지사항 업데이트 Service
	@Override
	public int updateNotice(Notice n) {
		System.out.println(n);
		return noticeDao.updateNotice(sqlSession, n);
	}

}
