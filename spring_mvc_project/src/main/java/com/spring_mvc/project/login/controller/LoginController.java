package com.spring_mvc.project.login.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	//사용자 로그인 폼으로 이동
	@RequestMapping(value="/login")
	public String viewUserLoginForm() {		
		return "jsp/login/login"; //로그인 폼으로 이동
	}
	
	//로그인 성공 시
	@RequestMapping(value="/login/userLoginSuccess")
	public String viewLuserLoginSucess(Principal principal, HttpSession session) {	
		String username = principal.getName(); //현 사용자 이름 가져와서
		session.setAttribute("sid", username); //세션 변수로 저장
		return "redirect:/"; //
	}
	
	//로그인 실패 시
	@RequestMapping(value="/login/userLoginFail")
	public String viewLuserLoginFail(Model model) {	
		model.addAttribute("ERRORMSG", "로그인 실패");
		return "jsp/login/login"; 
	}
	
	//로그아웃
	@RequestMapping(value="/login/logout")
	public String userLogout(HttpSession session) {	
		session.invalidate();
		return "redirect:/"; 
	}	
}

