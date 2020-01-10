package com.spring_mvc.project.member.dao;

import com.spring_mvc.project.member.model.MemberDTO;

public interface IMemberDAO {
	public void insertMember(MemberDTO dto);
	
	public MemberDTO getMemberInfo(String memId);
	
}
