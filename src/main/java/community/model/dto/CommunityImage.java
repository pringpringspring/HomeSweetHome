package community.model.dto;

import java.sql.Date;

public class CommunityImage {
	private int imgNo;
	private String memberId;
	private String nickName;
	private String title;
	private String content;
	private int readCount;
	private int likeCount;
	private Date regDate;
	public CommunityImage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommunityImage(int imgNo, String memberId, String nickName, String title, String content, int readCount,
			int likeCount, Date regDate) {
		super();
		this.imgNo = imgNo;
		this.memberId = memberId;
		this.nickName = nickName;
		this.title = title;
		this.content = content;
		this.readCount = readCount;
		this.likeCount = likeCount;
		this.regDate = regDate;
	}
	public int getImgNo() {
		return imgNo;
	}
	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "CommunityImage [imgNo=" + imgNo + ", memberId=" + memberId + ", nickName=" + nickName + ", title="
				+ title + ", content=" + content + ", readCount=" + readCount + ", likeCount=" + likeCount
				+ ", regDate=" + regDate + "]";
	}
	
	
	
}
