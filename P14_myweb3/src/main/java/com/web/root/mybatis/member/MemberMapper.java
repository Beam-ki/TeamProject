package com.web.root.mybatis.member;

import java.util.ArrayList;

import com.web.root.member.dto.MemberDTO;

public interface MemberMapper {

	public String user_check(String id);
	public MemberDTO mypage(String userid);
	public MemberDTO info(String userid);
//	public int infoUpdate(String id);
	public int register(MemberDTO member);
	public int logintest(MemberDTO member);
}
