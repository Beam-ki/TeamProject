package com.web.root.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.web.root.member.dto.MemberDTO;

public interface MemberService {

	public int user_check(String id);
	public void mypage(Model model, String userid);
	public void info(Model model, String userid);
	public String infoUpdate(MemberDTO member, HttpServletRequest request);
	public String infoUpdate_a(MemberDTO member, HttpServletRequest request);
	public int register(MemberDTO member);
	public int logintest(MemberDTO member);
	public String memberDelete(String id, MemberDTO member, HttpServletRequest request, HttpSession session);
	public String memberDelete_a(String id, MemberDTO member, HttpServletRequest request, HttpSession session);
	public String idcheck(String id);
	public List<MemberDTO> memberList();
	
	
}
