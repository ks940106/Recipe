package org.ks.tmr.vo;

import java.util.ArrayList;

public class LMRPageData {
	private ArrayList<LMR> list;
	private String pageNavi;
	public LMRPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LMRPageData(ArrayList<LMR> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<LMR> getList() {
		return list;
	}
	public void setList(ArrayList<LMR> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
