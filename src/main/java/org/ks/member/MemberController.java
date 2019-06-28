package org.ks.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@Autowired
	@Qualifier(value="memberService")
	private MemberService memberService;
	
	@RequestMapping(value="/loginPage.do")
	public String loginPage() {
		return "member/loginPage";
	}
	
}
