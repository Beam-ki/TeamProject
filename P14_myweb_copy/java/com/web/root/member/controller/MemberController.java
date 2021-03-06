package com.web.root.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping("/info_a")
	public String info_a(Model model, @RequestParam("id") String userid) {
		ms.info(model, userid);
		return "member/memberinfo_a";
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
	
	@RequestMapping("/infoUpdate_a")
	public void infoUpdate_a(MemberDTO member,
						   HttpServletRequest request,
						   HttpServletResponse response) throws Exception {
		String message=ms.infoUpdate_a(member, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print(message);
	}

	@RequestMapping("/register_form")
	public ModelAndView register_form() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/member/register");
		return mv;
	}
	
	@RequestMapping("/idcheck")
	@ResponseBody
	public String register(@RequestParam("id") String id) throws IOException {
		String result = ms.idcheck(id);
		return result;
	}
	
	@RequestMapping("/register")
	public ModelAndView register(MemberDTO member) throws IOException {
		ModelAndView mv=new ModelAndView();
		int result=ms.register(member);
		mv.setViewName("/member/successRegister");
		return mv;
	}
	
	
	@RequestMapping("/logintest")
	public ModelAndView logintest(MemberDTO member, HttpServletResponse res, HttpServletRequest request, HttpSession session) throws IOException {
		ModelAndView mv=new ModelAndView();
		session=request.getSession();
		int result=ms.logintest(member);
		if(result != 1) {
			res.setContentType("text/html;??charset=euc-kr");
			PrintWriter out=res.getWriter();
			out.println("<script>alert('????????? ?????? ??????????????? ??????????????????');??</script>");
			out.flush();
			mv.setViewName("/member/login");
			return mv;
		}else {
			if(request.getParameter("id").equals("admin")) {
				session.setAttribute(ADMIN_LOGIN, member.getId());
				mv.addObject("session",session);
				mv.addObject("result", result);
				mv.setViewName("redirect:/index");
				return mv;
			} else {
				session.setAttribute(LOGIN, member.getId());
				mv.addObject("session",session);
				mv.addObject("result", result);
				mv.setViewName("redirect:/index");
				return mv;
			}		
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
	
	@RequestMapping("/memberDelete_a")
	public void memberDelete_a(@RequestParam("id") String id,
									 MemberDTO member,
								     HttpServletRequest request,
								     HttpServletResponse response,
								     HttpSession session) throws Exception {
		String message=ms.memberDelete_a(id, member, request, session);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print(message);
	}
	
	// 01 ?????? ??????
    @RequestMapping("/memberList")
    public String memberList(Model model){
        List<MemberDTO> list = ms.memberList();
        model.addAttribute("list", list);
        return "member/memberList";
    }

}