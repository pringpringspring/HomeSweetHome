package community.model.dto;

import java.sql.Date;
import java.util.List;

public class PictureExt extends Picture {
	private int attachCount;
	private List<PictureAttachment> attachments;


	public PictureExt() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PictureExt(int attachCount, List<PictureAttachment> attachments) {
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

	public List<PictureAttachment> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<PictureAttachment> attachments) {
		this.attachments = attachments;
	}


	@Override
	public String toString() {
		return "PictureExt [attachCount=" + attachCount + ", attachments=" + attachments 
				+ "]";
	}


}
