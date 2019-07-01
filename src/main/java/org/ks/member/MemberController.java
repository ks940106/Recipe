package org.ks.member;

import javax.servlet.http.HttpServletRequest;
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
		HttpSession session =request.getSession();
		String view="";
		if(member!= null) {
			session.setAttribute("member", member);
			request.setAttribute("msg","로그인성공" );
			request.setAttribute("loc", "/");
			view="common/msg";
		}else {
			request.setAttribute("msg", "로그인 실패");
			view="common/msg";
		}
		return view;
	}
}
