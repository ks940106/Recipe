package org.ks.competition;

import java.util.ArrayList;

import org.ks.competition.vo.Competition;

public interface CompetitionService {
	public ArrayList<Competition> competitionList();
	public int insertCompetition(Competition c);
	public Competition competitionView(String competitionCheck);
}
