package org.ks.member;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ks.member.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {
	@Autowired
	@Qualifier(value="memberService")
	private MemberService memberService;
	
	@RequestMapping(value="/loginPage.do")
	public String loginPage() {
		return "member/loginPage";
	}
	@RequestMapping(value="/login.do")
	public String login(HttpServletRequest request,@RequestParam String id,@RequestParam String pw ) {
		Member m = new Member();
		m.setId(id);
		m.setPw(pw);
		Member member = memberService.login(m);
		String view="";
		if(member!= null) {
			HttpSession session =request.getSession();
			session.setAttribute("member", member);
			request.setAttribute("msg","로그인성공" );
			request.setAttribute("loc", "/");
		}else {
			request.setAttribute("msg", "로그인 실패");
			//request.setAttribute("loc", "WEB-INF/views/member/loginPage.jsp");
		}
		view="common/msg";
		return view;
	}
	@RequestMapping(value="/logout.do")
	public void logout(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		if(session!=null) {
			session.invalidate();
		}
		try {
			response.sendRedirect("/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
