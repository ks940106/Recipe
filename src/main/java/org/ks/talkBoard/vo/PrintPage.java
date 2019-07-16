package org.ks.talkBoard.vo;

public class PrintPage {
	private int start;
	private int end;
	private String type;
	public PrintPage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PrintPage(int start, int end, String type) {
		super();
		this.start = start;
		this.end = end;
		this.type = type;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	
}
