package org.ks.competition;

import java.util.ArrayList;

import org.ks.competition.vo.Competition;

public interface CompetitionService {
	public ArrayList<Competition> competitionList();
	public int insertCompetition(Competition c);
	public Competition competitionView(String competitionCheck);
	public int deleteCompetition(int competitionNo);
	public int competitionUpdate(Competition c);
	public Competition updateSelectOne(int competitionNo);
}
