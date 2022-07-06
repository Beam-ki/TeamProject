package com.web.root.mybatis.member;

import java.util.List;

import com.web.root.member.dto.MemberDTO;

public interface MemberMapper {
	//public List<BoardDTO> mypageList(@Param("s") int start, @Param("e") int end,String userid);	
	public String user_check(String id);
	public MemberDTO mypage(String userid);
	public MemberDTO info(String userid);
	public int infoUpdate(MemberDTO member);
	public int infoUpdate_a(MemberDTO member);
	public int register(MemberDTO member);
	public int logintest(MemberDTO member);
	public int memberDelete(String id);
	public String idcheck(String id);
	public List<MemberDTO> memberList();
	
	
}
