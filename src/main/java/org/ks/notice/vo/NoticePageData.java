package org.ks.notice.vo;

import java.util.ArrayList;

public class NoticePageData {
 private ArrayList<Notice> notice;
 private String pageNavi;
public ArrayList<Notice> getNotice() {
	return notice;
}
public void setNotice(ArrayList<Notice> notice) {
	this.notice = notice;
}
public String getPageNavi() {
	return pageNavi;
}
public void setPageNavi(String pageNavi) {
	this.pageNavi = pageNavi;
}
public NoticePageData(ArrayList<Notice> notice, String pageNavi) {
	super();
	this.notice = notice;
	this.pageNavi = pageNavi;
}
public NoticePageData() {
	super();
	// TODO Auto-generated constructor stub
}



 
 
}
