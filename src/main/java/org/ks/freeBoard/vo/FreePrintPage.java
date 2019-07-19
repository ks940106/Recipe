package org.ks.freeBoard.vo;

public class FreePrintPage {
	private int start;
	private int end;
	private int type;
	public FreePrintPage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FreePrintPage(int start, int end, int type) {
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	

}
