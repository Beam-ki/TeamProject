package com.web.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.web.root.member.dto.MemberDTO;

public interface MemberService {

	//public int user_check(HttpServletRequest request);
	public int user_check(String id);
	public void mypage(Model model, String userid);
	public void info(Model model, String userid);
	public String infoUpdate(MemberDTO member, HttpServletRequest request);
	public int register(MemberDTO member);
	public int logintest(MemberDTO member);
}
