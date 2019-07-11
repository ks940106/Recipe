package org.ks.participant;

import org.ks.member.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ParticipantController {
	@Autowired
	@Qualifier(value="participantServiceimpl")
	private ParticipantService participantServiceimpl;
	@RequestMapping(value="/participantInsert.do")
	public String participantMemberList(@RequestParam String id, Model model) {
		Member m = participantServiceimpl.participantMemberList(id);
		model.addAttribute("member",m);
		return "admin/competition/participantList";
	}
	
}
