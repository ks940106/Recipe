package org.ks.freeBoard.vo;

public class FreeBoardComment {
	private int commentNo;
	private int boardNo;
	private int commentLevel;
	private String commentWriter;
	private String commentContents;
	private int commentRef;
	public FreeBoardComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FreeBoardComment(int commentNo, int boardNo, int commentLevel, String commentWriter, String commentContents,
			int commentRef) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.commentLevel = commentLevel;
		this.commentWriter = commentWriter;
		this.commentContents = commentContents;
		this.commentRef = commentRef;
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
	
	

}
