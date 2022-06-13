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

//	@Override
//	public int user_check(HttpServletRequest request) {
//		MemberDTO dto=mapper.user_check(request.getParameter("id"));
//		if(dto!=null) {
//			if(request.getParameter("pw").equals(dto.getPw())){
//				return 0;
//			}
//		}
//		return 1;
//	}
	
	@Override
	public int user_check(String id){
		String usercheck = mapper.user_check(id);
		//int usercheck =Integer.parseInt(mapper.user_check(id));
		int result = Integer.parseInt(usercheck);
		return result;
	}

	@Override
	public void mypage(Model model, String userid) {
		model.addAttribute("member", mapper.info(userid));
	}
	
	@Override
	public void info(Model model, String userid) {
		model.addAttribute("info", mapper.info(userid));
	}
	
//	@Override
//	public void infoUpdate(Model model, String id) {
//		model.addAttribute("info", mapper.infoUpdate(id));
//		
//	}


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
	public int logintest(MemberDTO member) {
		int result=mapper.logintest(member);
		return result;
	}
	
	
	
	
}
