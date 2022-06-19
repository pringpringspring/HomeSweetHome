package community.model.dto;

import java.sql.Date;
import java.util.List;

public class KnowhowExt extends Knowhow {
	private int attachCount;
	private int commentCount;
	private List<Attachment> attachments; 
	private List<KnowhowComment> comments;

	public KnowhowExt() {

	}

	public KnowhowExt(int attachCount, int commentCount, List<Attachment> attachments, List<KnowhowComment> comments) {
		super();
		this.attachCount = attachCount;
		this.commentCount = commentCount;
		this.attachments = attachments;
		this.comments = comments;
	}

	public int getAttachCount() {
		return attachCount;
	}

	public void setAttachCount(int attachCount) {
		this.attachCount = attachCount;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public List<Attachment> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<Attachment> attachments) {
		this.attachments = attachments;
	}

	public List<KnowhowComment> getComments() {
		return comments;
	}

	public void setComments(List<KnowhowComment> comments) {
		this.comments = comments;
	}

	@Override
	public String toString() {
		return "KnowhowExt [attachCount=" + attachCount + ", commentCount=" + commentCount + ", attachments="
				+ attachments + ", comments=" + comments + "]";
	}

}
