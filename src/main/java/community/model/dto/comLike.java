package community.model.dto;

import java.io.Serializable;

public class comLike implements Serializable{
private String memderId;
private int commentNo;
private String likeIt;

public comLike() {
	super();
}
public comLike(String memderId, int commentNo, String likeIt) {
	super();
	this.memderId = memderId;
	this.commentNo = commentNo;
	this.likeIt = likeIt;
}
public String getMemderId() {
	return memderId;
}
public void setMemderId(String memderId) {
	this.memderId = memderId;
}
public int getCommentNo() {
	return commentNo;
}
public void setCommentNo(int commentNo) {
	this.commentNo = commentNo;
}
public String getLikeIt() {
	return likeIt;
}
public void setLikeIt(String likeIt) {
	this.likeIt = likeIt;
}
@Override
public String toString() {
	return "comLike [memderId=" + memderId + ", commentNo=" + commentNo + ", likeIt=" + likeIt + "]";
}


}
