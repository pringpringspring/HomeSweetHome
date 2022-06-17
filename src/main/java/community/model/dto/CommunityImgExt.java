package community.model.dto;

import java.sql.Date;
import java.util.List;

public class CommunityImgExt extends CommunityImage {
	private int attachCount;
	private List<CommunityImgAttachment> attachments;

	public CommunityImgExt() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommunityImgExt(int attachCount, List<CommunityImgAttachment> attachments) {
		super();
		this.attachCount = attachCount;
		this.attachments = attachments;
	}

	public int getAttachCount() {
		return attachCount;
	}

	public void setAttachCount(int attachCount) {
		this.attachCount = attachCount;
	}

	public List<CommunityImgAttachment> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<CommunityImgAttachment> attachments) {
		this.attachments = attachments;
	}

	@Override
	public String toString() {
		return "CommunityImgExt [attachCount=" + attachCount + ", attachments=" + attachments + "]";
	}

}
