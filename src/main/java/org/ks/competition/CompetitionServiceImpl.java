package org.ks.competition;

import java.util.ArrayList;

import org.ks.competition.vo.Competition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("competitionService")
public class CompetitionServiceImpl implements CompetitionService {
	@Autowired
	@Qualifier(value="competitionDao")
	private CompetitionDao competitionDao = new CompetitionDaoImpl();

	@Override
	public ArrayList<Competition> competitionList() {
		return (ArrayList<Competition>)(competitionDao.competitionList());
	}
}
