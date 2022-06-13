package com.web.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.web.root.member.dto.MemberDTO;
import com.web.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Override
	public int user_check(HttpServletRequest request) {
		MemberDTO dto=mapper.user_check(request.getParameter("id"));
		if(dto!=null) {
			if(request.getParameter("pw").equals(dto.getPw())){
				return 0;
			}
		}
		return 1;
	}

	@Override
	public void memberInfo(Model model) {
		model.addAttribute("memberList", mapper.memberInfo());
	}

	@Override
	public int register(MemberDTO member) {
		try {
			return mapper.register(member);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public void info(Model model, String userid) {
		model.addAttribute("info", mapper.info(userid));
	}
	
	
	
	
}