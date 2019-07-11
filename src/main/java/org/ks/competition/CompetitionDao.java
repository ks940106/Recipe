package org.ks.competition;

import java.util.List;

import org.ks.competition.vo.Competition;
import org.ks.participant.vo.Participant;

public interface CompetitionDao {
	public List competitionList();
	public int insertCompetition(Competition c);
	public List competitionView(String competitionCheck);
	public int deleteCompetition(int competitionNo);
	public int competitionUpdate(Competition c);
	public Competition updateSelectOne(int competitionNo);
	public List competitionResultView(int competitionNo);
	public List participantCheck(int competitionNo, String id);
	public List competitionListView(int competitionNo);
	public List participantView();
	public List participantMember();
}
