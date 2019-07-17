package org.ks.freeBoard.vo;

public class FreeBoard {
	
	private int BoardNo;
	private String BoardType;
	private String nickname;
	private String contents;
	public FreeBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FreeBoard(int boardNo, String boardType, String nickname, String contents) {
		super();
		BoardNo = boardNo;
		BoardType = boardType;
		this.nickname = nickname;
		this.contents = contents;
	}
	public int getBoardNo() {
		return BoardNo;
	}
	public void setBoardNo(int boardNo) {
		BoardNo = boardNo;
	}
	public String getBoardType() {
		return BoardType;
	}
	public void setBoardType(String boardType) {
		BoardType = boardType;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
}
