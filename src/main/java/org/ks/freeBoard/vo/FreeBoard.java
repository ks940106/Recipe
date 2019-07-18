package org.ks.freeBoard.vo;

public class FreeBoard {
	
	private int boardNo;
	private String boardType;
	private String nickname;
	private String title;
	private String contents;
	private int commentCount;
	private int viewCount;
	public FreeBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FreeBoard(int boardNo, String boardType, String nickname, String title, String contents, int commentCount,
			int viewCount) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.nickname = nickname;
		this.title = title;
		this.contents = contents;
		this.commentCount = commentCount;
		this.viewCount = viewCount;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
	
	
	
	
	
	
}
