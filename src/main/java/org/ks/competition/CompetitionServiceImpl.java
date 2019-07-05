package org.ks.competition;

import java.util.ArrayList;
import java.util.List;

import org.ks.competition.vo.Competition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("competitionServiceimpl")
public class CompetitionServiceImpl implements CompetitionService {
	@Autowired
	@Qualifier(value="competitionDaoimpl")
	private CompetitionDao competitionDaoimpl;

	@Override
	public ArrayList<Competition> competitionList() {
		return (ArrayList<Competition>)(competitionDaoimpl.competitionList());
	}

	@Override
	public int insertCompetition(Competition c) {
		return competitionDaoimpl.insertCompetition(c);
	}

	@Override
	public Competition competitionView(String competitionCheck) {
		List list = competitionDaoimpl.competitionView(competitionCheck);
		Competition c = null;
		if(!list.isEmpty()) {
			c = (Competition)list.get(0);
		}
		return c;
	}
	
	@Override
	public int deleteCompetition(int competitionNo) {
		return competitionDaoimpl.deleteCompetition(competitionNo);
	}
	
	@Override
	public int competitionUpdate(Competition c) {
		return competitionDaoimpl.competitionUpdate(c);
	}

	@Override
	public Competition updateSelectOne(int competitionNo) {
		return competitionDaoimpl.updateSelectOne(competitionNo);
	}

	
}
