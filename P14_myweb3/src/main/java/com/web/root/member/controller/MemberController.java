package com.web.root.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.root.HomeController;
import com.web.root.member.dto.MemberDTO;
import com.web.root.member.service.MemberService;
import com.web.root.session.name.MemberSession;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSession {

	@Autowired
	private MemberService ms; 
	
	@Autowired
	private HomeController hc;
	
	@GetMapping("login") 
	public String login() {
		return "member/login"; 
	}
//	@PostMapping("user_check")
//	public String userCheck(MemberDTO member) { 
//		int result=ms.user_check(member.getId());
//		System.out.println("도냐?");
//		
//		if(result==0) {
//			rs.addAttribute("id", request.getParameter("id"));
//			return "redirect:successLogin";
//		}
//		return "redirect:login";
//	}
	
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
	
	@RequestMapping("/mypage")
	public String mypage(Model model, @RequestParam("id") String userid) {
		ms.mypage(model, userid);
		return "member/mypage";
	}
	
	@RequestMapping("/info")
	public String info(Model model, @RequestParam("id") String userid) {
		ms.info(model, userid);
		return "member/memberinfo";
	}
	
	@RequestMapping("/infoUpdate")
	public void infoUpdate(MemberDTO member,
						   HttpServletRequest request,
						   HttpServletResponse response) throws Exception {
		String message=ms.infoUpdate(member, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print(message);
	}
		
	@GetMapping("boardAllList")
	public String boardAllList() {
		return "board/boardAllList";
	}
	
	@GetMapping("qna")
	public String qna() {
		return "board/qna";
	}
//	@RequestMapping("/register_form")
//	public String register_form() {
//		return "member/register";
//	}
	
	@RequestMapping("/register_form")
	public ModelAndView register_form() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/member/register");
		return mv;
	}
	
	
	@RequestMapping("/register")
	public ModelAndView register(MemberDTO member, RedirectAttributes rs, HttpServletResponse res) throws IOException {
		ModelAndView mv=new ModelAndView();
		System.out.println("안탐?");
		String id=member.getId();
		int result=ms.user_check(id);
		System.out.println(result);
		if(result > 0) {
			//중복
			System.out.println(result);
			res.setContentType("text/html; charset=euc-kr");
			PrintWriter out=res.getWriter();
			out.println("<script>alert('중복된 아이디 입니다'); </script>");
			out.flush();
			mv.addObject("member", member);
			mv.setViewName("/member/register");
			return mv;
		}else {
			//가입가능
			int result2=ms.register(member);
			System.out.println(result2);
			res.setContentType("text/html; charset=euc-kr");
			PrintWriter out=res.getWriter();
			out.println("<script>alert('회원가입이 완료되었습니다'); </script>");
			out.flush();
			mv.setViewName("/member/successRegister");
			return mv;
		}
	}
	
	@RequestMapping("/logintest")
	public ModelAndView logintest(MemberDTO member, HttpServletResponse res, HttpServletRequest request, HttpSession session) throws IOException {
		ModelAndView mv=new ModelAndView();
		session=request.getSession();
		int result=ms.logintest(member);
		if(result != 1) {
			res.setContentType("text/html; charset=euc-kr");
			PrintWriter out=res.getWriter();
			out.println("<script>alert('아이디 또는 비밀번호를 확인해주세요'); </script>");
			out.flush();
			mv.setViewName("/member/login");
			return mv;
		}else {
//			session.setAttribute("id", member.getId());
			session.setAttribute(LOGIN, member.getId());
			mv.addObject("session",session);
			mv.addObject("result", result);
			mv.setViewName("redirect:/index");
			return mv;
		}
	}
	
	@RequestMapping("/adminLogintest")
	public ModelAndView adlogintest(MemberDTO member, HttpServletResponse res, HttpServletRequest request, HttpSession session) throws IOException {
		ModelAndView mv=new ModelAndView();
		session=request.getSession();
		int result=ms.adminLogintest(member);
		if(result != 1) {
			res.setContentType("text/html; charset=euc-kr");
			PrintWriter out=res.getWriter();
			out.println("<script>alert('아이디 또는 비밀번호를 확인해주세요'); </script>");
			out.flush();
			mv.setViewName("/member/login");
			return mv;
		}else {
//			session.setAttribute("id", member.getId());
			session.setAttribute(ADMIN_LOGIN, member.getId());
			mv.addObject("session",session);
			mv.addObject("result", result);
			mv.setViewName("redirect:/index");
			return mv;
		}
	}
	
	@RequestMapping("/logouttest")
	public ModelAndView logouttest(HttpServletRequest request, HttpSession session) {
		ModelAndView mv=new ModelAndView();
		session=request.getSession();
		session.invalidate();
		mv.setViewName("redirect:/index");
		return mv;
	}
	
	@RequestMapping("/memberDelete")
	public void memberDelete(@RequestParam("id") String id,
									 MemberDTO member,
								     HttpServletRequest request,
								     HttpServletResponse response,
								     HttpSession session) throws Exception {
		String message=ms.memberDelete(id, member, request, session);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print(message);
	}
}