package org.ks.participant.vo;

import java.sql.Date;

public class Participant {
	private int participantNo;
	private int competitionNo;
	private String id;
	private String participantPass;
	private String participantContent;
	private String participantResult;
	private Date participantDate;
	public Participant() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Participant(int participantNo, int competitionNo, String id, String participantPass,
			String participantContent, String participantResult, Date participantDate) {
		super();
		this.participantNo = participantNo;
		this.competitionNo = competitionNo;
		this.id = id;
		this.participantPass = participantPass;
		this.participantContent = participantContent;
		this.participantResult = participantResult;
		this.participantDate = participantDate;
	}
	public int getParticipantNo() {
		return participantNo;
	}
	public void setParticipantNo(int participantNo) {
		this.participantNo = participantNo;
	}
	public int getCompetitionNo() {
		return competitionNo;
	}
	public void setCompetitionNo(int competitionNo) {
		this.competitionNo = competitionNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getParticipantPass() {
		return participantPass;
	}
	public void setParticipantPass(String participantPass) {
		this.participantPass = participantPass;
	}
	public String getParticipantContent() {
		return participantContent;
	}
	public void setParticipantContent(String participantContent) {
		this.participantContent = participantContent;
	}
	public String getParticipantResult() {
		return participantResult;
	}
	public void setParticipantResult(String participantResult) {
		this.participantResult = participantResult;
	}
	public Date getParticipantDate() {
		return participantDate;
	}
	public void setParticipantDate(Date participantDate) {
		this.participantDate = participantDate;
	}
	
}
