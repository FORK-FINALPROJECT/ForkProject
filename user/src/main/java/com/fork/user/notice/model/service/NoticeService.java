package com.fork.user.notice.model.service;

import java.util.List;

import com.fork.user.notice.model.vo.Notice;

public interface NoticeService {
	
	public List<Notice> selectNoticeList();

	public Notice noticeDetailView(int nno);

}
