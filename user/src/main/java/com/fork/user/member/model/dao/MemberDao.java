package com.fork.user.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.user.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertMemeber(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member login(Member m) {
		return sqlSession.selectOne("memberMapper.login", m);
	}

	public Member selectId(Member m) {
		return sqlSession.selectOne("memberMapper.selectId", m);
	}
	
	public Member selectPwd(Member m) {
		return sqlSession.selectOne("memberMapper.selectPwd", m);
	}

	public void updateNumber(Member m) {
		sqlSession.update("memberMapper.updateNumber", m);
	}

}
