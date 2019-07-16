package org.ks.talkBoard.vo;

public class BoardLike {
	
	private int likeNo;
	private int boardNo;
	private String memberId;
	private int likeCheck;
	public BoardLike() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardLike(int likeNo, int boardNo, String memberId, int likeCheck) {
		super();
		this.likeNo = likeNo;
		this.boardNo = boardNo;
		this.memberId = memberId;
		this.likeCheck = likeCheck;
	}
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getLikeCheck() {
		return likeCheck;
	}
	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}
	
	
}
