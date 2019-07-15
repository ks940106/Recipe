package org.ks.talkBoard.vo;

import java.util.ArrayList;

public class TalkBoardPageData {
	private ArrayList<TalkBoard> list;
	private String pageNavi;
	private String type;
	public TalkBoardPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TalkBoardPageData(ArrayList<TalkBoard> list, String pageNavi, String type) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.type = type;
	}
	public ArrayList<TalkBoard> getList() {
		return list;
	}
	public void setList(ArrayList<TalkBoard> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	
}
