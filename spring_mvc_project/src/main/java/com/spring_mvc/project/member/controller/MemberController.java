package com.spring_mvc.project.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_mvc.project.member.model.MemberDTO;
import com.spring_mvc.project.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	//회원가입 폼으로 이동
	@RequestMapping(value="/member/join")
	public String viewUserLoginForm() {		
		return "jsp/member/join"; //로그인 폼으로 이동
	}
	
	@RequestMapping(value="/member/insertjoin")
	public String insertMember(MemberDTO dto) {
		service.insertMember(dto);
		return "jsp/login/login";
	}
	
	
}

