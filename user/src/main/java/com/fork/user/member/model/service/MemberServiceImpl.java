package com.fork.user.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fork.user.member.model.dao.MemberDao;
import com.fork.user.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public int insertMember(Member m) {
		return memberDao.insertMemeber(m);
	}

	@Override
	public Member login(Member m) {
		return memberDao.login(m);
	}

}
