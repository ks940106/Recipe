package org.ks.competition.vo;

import java.util.ArrayList;

public class CompetitionPageData {
	private ArrayList<Competition> list;
	private String pageNavi;
	public CompetitionPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CompetitionPageData(ArrayList<Competition> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Competition> getList() {
		return list;
	}
	public void setList(ArrayList<Competition> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
