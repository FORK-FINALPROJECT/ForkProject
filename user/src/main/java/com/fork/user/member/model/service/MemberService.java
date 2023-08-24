package com.fork.user.member.model.service;

import com.fork.user.member.model.vo.Member;

public interface MemberService {

	int login(Member m);
	
	int insertMember(Member m);

}
