package org.ks.talkBoard.vo;

public class MainBoard {
	private int boardNo;
	private String boardType;
	private String nickname;
	private String boardImg;
	private String boardContents;
	private int commentCount;
	private int likeCount;
	public MainBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MainBoard(int boardNo, String boardType, String nickname, String boardImg, String boardContents,
			int commentCount, int likeCount) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.nickname = nickname;
		this.boardImg = boardImg;
		this.boardContents = boardContents;
		this.commentCount = commentCount;
		this.likeCount = likeCount;
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
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	
}
