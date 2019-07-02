package org.ks.competition.vo;

import java.sql.Date;

public class Competition {
	private int competitionNo;
	private String competitionTitle;
	private String competitionContents;
	private String competitionImg;
	private String competitionVideo;
	private String competitionResult;
	private Date competitionDate;
	private String competitionCheck;
	public Competition() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Competition(int competitionNo, String competitionTitle, String competitionContents, String competitionImg,
			String competitionVideo, String competitionResult, Date competitionDate, String competitionCheck) {
		super();
		this.competitionNo = competitionNo;
		this.competitionTitle = competitionTitle;
		this.competitionContents = competitionContents;
		this.competitionImg = competitionImg;
		this.competitionVideo = competitionVideo;
		this.competitionResult = competitionResult;
		this.competitionDate = competitionDate;
		this.competitionCheck = competitionCheck;
	}
	public int getCompetitionNo() {
		return competitionNo;
	}
	public void setCompetitionNo(int competitionNo) {
		this.competitionNo = competitionNo;
	}
	public String getCompetitionTitle() {
		return competitionTitle;
	}
	public void setCompetitionTitle(String competitionTitle) {
		this.competitionTitle = competitionTitle;
	}
	public String getCompetitionContents() {
		return competitionContents;
	}
	public void setCompetitionContents(String competitionContents) {
		this.competitionContents = competitionContents;
	}
	public String getCompetitionImg() {
		return competitionImg;
	}
	public void setCompetitionImg(String competitionImg) {
		this.competitionImg = competitionImg;
	}
	public String getCompetitionVideo() {
		return competitionVideo;
	}
	public void setCompetitionVideo(String competitionVideo) {
		this.competitionVideo = competitionVideo;
	}
	public String getCompetitionResult() {
		return competitionResult;
	}
	public void setCompetitionResult(String competitionResult) {
		this.competitionResult = competitionResult;
	}
	public Date getCompetitionDate() {
		return competitionDate;
	}
	public void setCompetitionDate(Date competitionDate) {
		this.competitionDate = competitionDate;
	}
	public String getCompetitionCheck() {
		return competitionCheck;
	}
	public void setCompetitionCheck(String competitionCheck) {
		this.competitionCheck = competitionCheck;
	}
	
}
