package com.spring_mvc.project.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_mvc.project.member.dao.IMemberDAO;
import com.spring_mvc.project.member.model.MemberDTO;

@Service
public class MemberService implements IMemberService {

	@Autowired
	@Qualifier("IMemberDAO")
	IMemberDAO dao;
	
	@Override
	public void insertMember(MemberDTO dto) {
		dao.insertMember(dto);
	}

	@Override
	public MemberDTO getMemberInfo(String memId) {
		
		return dao.getMemberInfo(memId);
	}


}
