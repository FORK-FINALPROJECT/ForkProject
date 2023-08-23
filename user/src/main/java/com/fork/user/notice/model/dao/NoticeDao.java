package com.fork.user.notice.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.user.notice.model.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Repository
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Notice> selectNoticeList() {
		
		return sqlSession.selectList("noticeMapper.selectNoticeList");
	}

	public Notice noticeDetailView(int nno) {
		return sqlSession.selectOne("noticeMapper.noticeDetailView", nno);
	}

}

