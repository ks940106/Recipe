package org.ks.talkBoard.vo;

public class TalkBoard {
	private int boardNo;
	private String boardType;
	private String nickname;
	private String boardImg;
	private String boardContents;
	public TalkBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TalkBoard(int boardNo, String boardType, String nickname, String boardImg, String boardContents) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.nickname = nickname;
		this.boardImg = boardImg;
		this.boardContents = boardContents;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBoardImg() {
		return boardImg;
	}
	public void setBoardImg(String boardImg) {
		this.boardImg = boardImg;
	}
	public String getBoardContents() {
		return boardContents;
	}
	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}
	
}
