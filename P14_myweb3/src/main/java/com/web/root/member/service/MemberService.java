package com.web.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.web.root.member.dto.MemberDTO;

public interface MemberService {

	//public int user_check(HttpServletRequest request);
	public int user_check(String id);
	public void memberInfo(Model model);
	public int register(MemberDTO member);
	public void info(Model model, String userid);
	public int logintest(MemberDTO member);
}
