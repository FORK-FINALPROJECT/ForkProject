package com.fork.user.member.model.service;

import com.fork.user.member.model.vo.Member;

public interface MemberService {

	Member login(Member m);
	
	int insertMember(Member m);

	Member selectId(Member m);

	Member selectPwd(Member m);

	void checkNumber(Member m);

}
