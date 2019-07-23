package org.ks.member.vo;

import java.util.ArrayList;

public class MemberPageData {
	private ArrayList<Member> member;
	private String PageNavi;
	public ArrayList<Member> getMember() {
		return member;
	}
	public void setMember(ArrayList<Member> member) {
		this.member = member;
	}
	public String getPageNavi() {
		return PageNavi;
	}
	public void setPageNavi(String pageNavi) {
		PageNavi = pageNavi;
	}
	public MemberPageData(ArrayList<Member> member, String pageNavi) {
		super();
		this.member = member;
		PageNavi = pageNavi;
	}
	public MemberPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
