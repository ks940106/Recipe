package org.ks.tmr.vo;

import java.util.ArrayList;

public class TMRPageData {
	private ArrayList<TMR> list;
	private String pageNavi;
	public TMRPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TMRPageData(ArrayList<TMR> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<TMR> getList() {
		return list;
	}
	public void setList(ArrayList<TMR> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
