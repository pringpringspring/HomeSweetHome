package community.model.service;
import static common.JdbcTemplate.*;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import community.model.dao.EventDao;
import community.model.dto.Event;
import community.model.dto.EventAttachment;
import community.model.dto.EventExt;

public class EventService {
	private EventDao ed = new EventDao();

	public int getTotalContent() {
		Connection conn = getConnection();
		int totalContent = ed.getTotalContents(conn);
		close(conn);
		return totalContent;
	}

	public List<EventExt> findAll(Map<String, Object> param) {
		Connection conn = getConnection();
		List<EventExt> list = ed.findAll(conn, param);
		close(conn);
		return list;
	}
	
	/*public int insertBoard(Event event) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = ed.insertBoard(conn, event);
			int no = ed.findCurrentBoardNo(conn);
			event.setNo(no);
			System.out.println("방금 등록된 이벤트.no = " + no);

			List<EventAttachment> attach = ((EventExt) event).getAttachments();
			if(attach != null && !attach.isEmpty()) {
				for(EventAttachment att : attach) {
					att.setNo(no);
					result = ed.insertAttachment(conn, attach);
				}
			}
			commit(conn);
		} catch(Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	} */

	public EventExt findByNo(int no) {
		Connection conn = getConnection();
		EventExt event = ed.findByNo(conn, no); 
		List<EventAttachment> attachments = ed.findAttachmentByBoardNo(conn, no); 
		event.setAttachments(attachments);
		close(conn);
		return event;
	}


	
	
	
}
