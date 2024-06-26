package com.tp.travely.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.tp.travely.common.model.vo.PageInfo;
import com.tp.travely.notice.model.vo.Notice;

@Component
public class NoticeDao {

	// 공지사항 리스트뷰 Dao
	public ArrayList<Notice> adminNoticeListView(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("noticeMapper.adminNoticeListView");
	}


	// 공지사항 isnert Dao
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}


	// 공지사항 삭제 Dao
	public int deleteNotice(SqlSessionTemplate sqlSession, int num) {
		return sqlSession.update("noticeMapper.deleteNotice", num);
	}

	// 공지사항 상세보기 Dao(작업중)
	public Notice detailNotice(SqlSessionTemplate sqlSession, int num) {
		return sqlSession.selectOne("noticeMapper.detailNotice", num);
	}


	// 공지사항 업데이트 Dao
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}


	// 공지사항 개수 Dao
	public int noticeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.noticeCount");
	}


	public ArrayList<Notice> noticetListView(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("noticeMapper.adminNoticeListView", null, rowBounds);
	}
	

}
