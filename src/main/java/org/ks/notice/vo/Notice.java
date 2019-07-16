package org.ks.notice.vo;

import java.sql.Date;

public class Notice {
 private int idx;
 private String noticeTitle;
 private String noticeContent;
 private Date noticeDate;
public int getIdx() {
	return idx;
}
public void setIdx(int idx) {
	this.idx = idx;
}
public String getNoticeTitle() {
	return noticeTitle;
}
public void setNoticeTitle(String noticeTitle) {
	this.noticeTitle = noticeTitle;
}
public String getNoticeContent() {
	return noticeContent;
}
public void setNoticeContent(String noticeContent) {
	this.noticeContent = noticeContent;
}
public Date getNoticeDate() {
	return noticeDate;
}
public void setNoticeDate(Date noticeDate) {
	this.noticeDate = noticeDate;
}
public Notice() {
	super();
	// TODO Auto-generated constructor stub
}
public Notice(int idx, String noticeTitle, String noticeContent, Date noticeDate) {
	super();
	this.idx = idx;
	this.noticeTitle = noticeTitle;
	this.noticeContent = noticeContent;
	this.noticeDate = noticeDate;
}
 
 
}
