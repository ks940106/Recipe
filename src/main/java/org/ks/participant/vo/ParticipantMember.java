package org.ks.participant.vo;

import java.sql.Date;

public class ParticipantMember {
	private int participantNo;
	private int competitionNo;
	private String id;
	private String participantPass;
	private String participantContent;
	private String participantResult;
	private Date participantDate;
	private String name;
	private String nickname;
	private String gender;
	private String phone;
	public ParticipantMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ParticipantMember(int participantNo, int competitionNo, String id, String participantPass,
			String participantContent, String participantResult, Date participantDate, String name, String nickname,
			String gender, String phone) {
		super();
		this.participantNo = participantNo;
		this.competitionNo = competitionNo;
		this.id = id;
		this.participantPass = participantPass;
		this.participantContent = participantContent;
		this.participantResult = participantResult;
		this.participantDate = participantDate;
		this.name = name;
		this.nickname = nickname;
		this.gender = gender;
		this.phone = phone;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}
