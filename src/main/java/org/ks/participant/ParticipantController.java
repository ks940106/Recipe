package org.ks.participant;

import org.ks.member.vo.Member;
import org.ks.participant.vo.Participant;
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
	public String participantMemberInsert(Participant vo) {
/*		System.out.println(vo.getCompetitionNo());
		System.out.println(vo.getId());
		System.out.println(vo.getParticipantContent());*/
		String str = vo.getParticipantContent().replaceAll("<", "&lt");
		System.out.println(vo.getParticipantContent());
		vo.setParticipantContent(str);
		System.out.println(str);
		participantServiceimpl.participantInsert(vo);
		return "redirect:/competitionList.do?competitionCheck='Y'&id="+vo.getId();
	}	
}
