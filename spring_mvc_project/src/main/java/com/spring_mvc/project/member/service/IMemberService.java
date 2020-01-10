package com.spring_mvc.project.member.service;

import com.spring_mvc.project.member.model.MemberDTO;

public interface IMemberService {
	void insertMember(MemberDTO dto);

	MemberDTO getMemberInfo(String memId);
}
