package community.model.dto;

public class LikeDTO {
	private int likeNo;
	private String memberId;
	private int boardNo;

	/* private int likeCheck; */
	public LikeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LikeDTO(int likeNo, String memberId, int boardNo) {
		super();
		this.likeNo = likeNo;
		this.memberId = memberId;
		this.boardNo = boardNo;
	}

	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
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

	@Override
	public String toString() {
		return "LikeDTO [likeNo=" + likeNo + ", memberId=" + memberId + ", boardNo=" + boardNo + "]";
	}
	

}
