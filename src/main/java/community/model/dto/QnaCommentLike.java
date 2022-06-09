package community.model.dto;



public class QnaCommentLike extends QnaBoardComment{
	private int likeNo;
	private int commentNo;
	private String memberId;
	private int boardNo;
	public QnaCommentLike() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnaCommentLike(int likeNo, int commentNo, String memberId, int boardNo) {
		super();
		this.likeNo = likeNo;
		this.commentNo = commentNo;
		this.memberId = memberId;
		this.boardNo = boardNo;
	}
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
}
