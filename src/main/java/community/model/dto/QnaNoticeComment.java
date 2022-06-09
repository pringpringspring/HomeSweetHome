package community.model.dto;

import java.sql.Connection;
import java.sql.Date;

public class QnaNoticeComment {
	private int commentNo;
	private String memberId;
	private int noticeNo;
	private String content;
	private Date regDate;
	private int likeCnt;
	private int commentLevel;
	public QnaNoticeComment(int commentNo, String memberId, int noticeNo, String content, Date regDate, int likeCnt,
			int commentLevel, int commentRef) {
		super();
		this.commentNo = commentNo;
		this.memberId = memberId;
		this.noticeNo = noticeNo;
		this.content = content;
		this.regDate = regDate;
		this.likeCnt = likeCnt;
		this.commentLevel = commentLevel;
		this.commentRef = commentRef;
	}
	private int commentRef;
	public QnaNoticeComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getCommentLevel() {
		return commentLevel;
	}
	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCommentRef() {
		return commentRef;
	}
	public void setCommentRef(int commentRef) {
		this.commentRef = commentRef;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


}
