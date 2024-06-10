package com.tp.travely.notice.model.service;

import java.util.ArrayList;

import com.tp.travely.notice.model.vo.Notice;

public interface NoticeService {

	
	ArrayList<Notice> adminNoticeListView();

	int insertNotice(Notice n);

	int deleteNotice(int num);

	Notice detailNotice(int num);

	int updateNotice(Notice n);

}
