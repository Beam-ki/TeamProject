package com.web.root.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.root.member.dto.MemberDTO;
import com.web.root.member.service.MemberService;
import com.web.root.session.name.MemberSession;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSession {

	@Autowired
	private MemberService ms; 
	
	@GetMapping("login") 
	public String login() {
		return "member/login"; 
	}
	
	@PostMapping("user_check")
	public String userCheck(HttpServletRequest request, RedirectAttributes rs) { 
		int result=ms.user_check(request);
		if(result==0) {
			rs.addAttribute("id", request.getParameter("id"));
			return "redirect:successLogin";
		}
		return "redirect:login";
	}
	
	@RequestMapping("successLogin")
	public String successLogin(@RequestParam("id") String id, HttpSession session) {
		session.setAttribute(LOGIN, id);
		return "member/successLogin";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		if(session.getAttribute("loginUser")!=null) {
			session.invalidate();
		}
		return "redirect:/index";
	}
	
	@GetMapping("memberInfo")
	public String memberInfo(Model model) {
		ms.memberInfo(model);
		return "member/memberInfo";
	}
	
	@RequestMapping("/register_form")
	public String register_form() {
		return "member/register";
	}
	
	@RequestMapping("/register")
	public String register(MemberDTO member) {
		int result=ms.register(member);
		if(result==1) 
			return "redirect:login";
		return "redirect:register_form";
	}
	
	@RequestMapping("/info")
	public String info(Model model, @RequestParam("id") String userid) {
		ms.info(model, userid);
		return "member/info";
	}
}


























