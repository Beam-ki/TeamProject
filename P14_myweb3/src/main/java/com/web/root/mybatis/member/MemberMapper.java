package com.web.root.mybatis.member;

import java.util.ArrayList;

import com.web.root.member.dto.MemberDTO;

public interface MemberMapper {

	public String user_check(String id);
	public ArrayList<MemberDTO> memberInfo();
	public int register(MemberDTO member);
	public MemberDTO info(String userid);
	public int logintest(MemberDTO member);
}