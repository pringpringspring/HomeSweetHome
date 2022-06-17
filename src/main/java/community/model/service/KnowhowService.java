package community.model.service;
import static common.JdbcTemplate.close;
import static common.JdbcTemplate.commit;
import static common.JdbcTemplate.getConnection;
import static common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import community.model.dao.KnowhowDao;
import community.model.dto.Attachment;
import community.model.dto.Knowhow;
import community.model.dto.KnowhowComment;
import community.model.dto.KnowhowExt;
import community.model.dto.comLike;

public class KnowhowService {
KnowhowDao kd = new KnowhowDao();


public List<KnowhowExt> findAll(Map<String, Object> param) {
	Connection conn = getConnection();
	List<KnowhowExt> list = kd.findAll(conn, param);
	close(conn);
	return list;
}
public int getTotalContents() {
	Connection conn = getConnection();
	int totalContents = kd.getTotalContents(conn);
	close(conn);
	return totalContents;
}

public int insertBoard(Knowhow kh) {
	int result = 0;
	Connection conn = getConnection();
	try {
		
		result = kd.insertBoard(conn, kh); 

		int no = kd.findCurrentBoardNo(conn); 
		kh.setNo(no);
		System.out.println("방금 등록된 노하우.no = " + no);

		List<Attachment> attachments = ((KnowhowExt) kh).getAttachments();
		if(attachments != null && !attachments.isEmpty()) {
			for(Attachment attach : attachments) {
				attach.setBoardNo(no);
				result = kd.insertAttachment(conn, attach);
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
}

public KnowhowExt findByNo(int no) {
	Connection conn = getConnection();
	KnowhowExt kh = kd.findByNo(conn, no); // board테이블 조회
	List<Attachment> attachments = kd.findAttachmentByBoardNo(conn, no); // attachment 테이블 조회
	List<KnowhowComment> comments = kd.findBoardCommentByBoardNo(conn, no);
	kh.setAttachments(attachments);
	kh.setComments(comments);
	close(conn);
	return kh;
}

public int updateReadCount(int no) {
	int result = 0;
	Connection conn = getConnection();
	try {
		result = kd.updateReadCount(conn, no);
		commit(conn);
	} catch(Exception e) {
		rollback(conn);
		throw e;
	} finally {
		close(conn);
	}
	return result;
}
public Attachment findAttachmentByNo(int no) {
	Connection conn = getConnection();
	Attachment attach = kd.findAttachmentByNo(conn, no);
	close(conn);
	return attach;
}
public int deleteBoard(int no) {
	Connection conn = getConnection();
	int result = 0;
	try {
		result = kd.deleteBoard(conn, no);
		commit(conn);
	} catch(Exception e) {
		rollback(conn);
		throw e; 
	} finally {
		close(conn);
	}
	return result;
}

public int updateBoard(KnowhowExt kh) {
	int result = 0;
	Connection conn = getConnection();
	try {
		
		// 1. board 수정
		result = kd.updateBoard(conn, kh);
		
		// 2. attachment에 등록
		List<Attachment> attachments = ((KnowhowExt) kh).getAttachments();
		if(attachments != null && !attachments.isEmpty()) {
			for(Attachment attach : attachments) {
				result = kd.insertAttachment(conn, attach);
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
}

public int deleteAttachment(int no) {
	Connection conn = getConnection();
	int result = 0;
	try {
		result = kd.deleteAttachment(conn, no);
		commit(conn);
	} catch(Exception e) {
		rollback(conn);
		throw e; 
	} finally {
		close(conn);
	}
	return result;
}

public int insertBoardComment(KnowhowComment kc) {
	Connection conn = getConnection();
	int result = 0;
	try {
		result = kd.insertBoardComment(conn, kc);
		commit(conn);
	} catch(Exception e) {
		rollback(conn);
		throw e; 
	} finally {
		close(conn);
	}
	return result;
}


public int deleteBoardComment(int no) {
	Connection conn = getConnection();
	int result = 0;
	try {
		result = kd.deleteBoardComment(conn, no);
		commit(conn);
	} catch(Exception e) {
		rollback(conn);
		throw e; 
	} finally {
		close(conn);
	}
	return result;
}
public comLike selectLikeOne(int board_num, String memberId) {
	Connection conn = getConnection();
	comLike cl= kd.selectLikeOne(conn, board_num, memberId);
	close(conn);
	return cl;
}
public List<KnowhowComment> selectCommentList(int board_num) {
	Connection conn = getConnection();
	List<KnowhowComment> list = kd.selectCommentList(conn,board_num);
	close(conn);
	return list;
}
public int deleteLike(comLike cl) {
	Connection conn = getConnection();
	int result =kd.deleteLike(conn, cl);
	if(result>0)
		commit(conn);
	else 
		rollback(conn);
	close(conn);
	return result;
}
public int insertLike(comLike like) {
	Connection conn = getConnection();
	int result = kd.insertLike(conn, like);
	if(result > 0)
		commit(conn);
	else
		rollback(conn);
	close(conn);
	return result;
}


/*
 * public int commentCount(int no) { Connection conn = getConnection(); int
 * result = kd.commentCount(conn,no); close(conn); return result; }
 */


}
