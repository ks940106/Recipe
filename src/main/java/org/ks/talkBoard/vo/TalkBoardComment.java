package org.ks.talkBoard.vo;

public class TalkBoardComment {
	private int commentNo;
	private int boardNo;
	private int commentLevel;
	private String commentWriter;
	private String commentContents;
	private int commentRef;
	private String memberImg;
	public TalkBoardComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TalkBoardComment(int commentNo, int boardNo, int commentLevel, String commentWriter, String commentContents,
			int commentRef, String memberImg) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.commentLevel = commentLevel;
		this.commentWriter = commentWriter;
		this.commentContents = commentContents;
		this.commentRef = commentRef;
		this.memberImg = memberImg;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getCommentLevel() {
		return commentLevel;
	}
	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}
	public String getCommentWriter() {
		return commentWriter;
	}
	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}
	public String getCommentContents() {
		return commentContents;
	}
	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}
	public int getCommentRef() {
		return commentRef;
	}
	public void setCommentRef(int commentRef) {
		this.commentRef = commentRef;
	}
	public String getMemberImg() {
		return memberImg;
	}
	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}
	
	
}
