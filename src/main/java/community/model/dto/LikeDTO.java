package community.model.dto;

public class LikeDTO  extends Picture{
	private String memberId;
	private int no;
	private String likeit;
	public LikeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LikeDTO(String memberId, int no, String likeit) {
		super();
		this.memberId = memberId;
		this.no = no;
		this.likeit = likeit;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getLikeit() {
		return likeit;
	}
	public void setLikeit(String likeit) {
		this.likeit = likeit;
	}
	@Override
	public String toString() {
		return "LikeDTO [memberId=" + memberId + ", no=" + no + ", likeit=" + likeit + "]";
	}
	
	
}
