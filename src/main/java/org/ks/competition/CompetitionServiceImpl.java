package org.ks.competition;

import java.util.ArrayList;

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
}
