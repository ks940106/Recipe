package org.ks.competition;

import java.util.ArrayList;

import org.ks.competition.vo.Competition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CompetitionController {
	@Autowired
	@Qualifier(value="competitionServiceimpl")
	private CompetitionService competitionServiceimpl;
	@RequestMapping(value="/competitionList.do")
	public ModelAndView competitionList() {
		ArrayList<Competition> list = competitionServiceimpl.competitionList();
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("competition/competitionList");
		}else {
			mav.setViewName("competition/competitionListError");
		}
		return mav;
	}
	
}
