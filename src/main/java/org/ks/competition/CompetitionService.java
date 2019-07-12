package org.ks.competition;

import java.util.ArrayList;

import org.ks.competition.vo.Competition;
import org.ks.participant.vo.Participant;
import org.ks.participant.vo.ParticipantMember;

public interface CompetitionService {
	public ArrayList<Competition> competitionList();
	public int insertCompetition(Competition c);
	public Competition competitionView(String competitionCheck);
	public int deleteCompetition(int competitionNo);
	public int competitionUpdate(Competition c);
	public Competition updateSelectOne(int competitionNo);
	public Competition competitionResultView(int competitionNo);
	public Participant participantCheck(int competitionNo, String id);
	public Competition competitionListView(int competitionNo);
	public ArrayList<ParticipantMember> participantView(int competitionNo);
	public ArrayList<ParticipantMember> participantPassList(int competitionNo);
	public int participantUpdate(String[] checkArr, int competitionNo);
	public int participantPass(String[] checkPass, int competitionNo);
}
