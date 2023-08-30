package com.fork.user.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.user.member.model.vo.Member;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertMemeber(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member login(Member m) {
		return sqlSession.selectOne("memberMapper.login", m);
	}
	
}
