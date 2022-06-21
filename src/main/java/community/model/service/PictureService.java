package community.model.service;
import static common.JdbcTemplate.close;
import static common.JdbcTemplate.commit;
import static common.JdbcTemplate.getConnection;
import static common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JdbcTemplate;
import community.model.dao.PictureDao;
import community.model.dto.LikeDTO;
import community.model.dto.Picture;
import community.model.dto.PictureAttachment;
import community.model.dto.PictureExt;


public class PictureService {
	PictureDao cd = new PictureDao();
	
	
	public List<PictureExt> findAll(Map<String, Object> param) {
		Connection conn = getConnection();
		List<PictureExt> list = cd.findAll(conn, param);
		close(conn);
		return list;
	}
	public int getTotalContents() {
		Connection conn = getConnection();
		int totalContents = cd.getTotalContents(conn);
		close(conn);
		return totalContents;
	}

	public int insertBoard(Picture img) {
		int result = 0;
		Connection conn = getConnection();
		try {
			
			result = cd.insertBoard(conn, img); 

			int no = cd.findCurrentBoardNo(conn); 
			img.setImgNo(no);
			System.out.println("방금 등록된 사진.no = " + no);

			List<PictureAttachment> attachments = ((PictureExt) img).getAttachments();
			if(attachments != null && !attachments.isEmpty()) {
				for(PictureAttachment attach : attachments) {
					attach.setImgNo(no);
					result = cd.insertAttachment(conn, attach);
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

	public PictureExt findByNo(int no) {
		Connection conn = getConnection();
		PictureExt img = cd.findByNo(conn, no); // board테이블 조회
		List<PictureAttachment> attachments = cd.findAttachmentByBoardNo(conn, no); // attachment 테이블 조회
		img.setAttachments(attachments);
		close(conn);
		return img;
	}

	public int updateReadCount(int no) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = cd.updateReadCount(conn, no);
			commit(conn);
		} catch(Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}
	public PictureAttachment findAttachmentByNo(int no) {
		Connection conn = getConnection();
		PictureAttachment attach = cd.findAttachmentByNo(conn, no);
		close(conn);
		return attach;
	}
	
	
	public int deleteBoard(int no) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = cd.deleteBoard(conn, no);
			commit(conn);
		} catch(Exception e) {
			rollback(conn);
			throw e; 
		} finally {
			close(conn);
		}
		return result;
	}

	public int updateBoard(PictureExt img) {
		int result = 0;
		Connection conn = getConnection();
		try {
			
			// 1. board 수정
			result = cd.updateBoard(conn, img);
			
			// 2. attachment에 등록
			List<PictureAttachment> attachments = ((PictureExt) img).getAttachments();
			if(attachments != null && !attachments.isEmpty()) {
				for(PictureAttachment attach : attachments) {
					result = cd.insertAttachment(conn, attach);
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
			result = cd.deleteAttachment(conn, no);
			commit(conn);
		} catch(Exception e) {
			rollback(conn);
			throw e; 
		} finally {
			close(conn);
		}
		return result;
	}
	
	public ArrayList<PictureExt> productList(int start, int end, int space, int shape)
	{
		ArrayList<PictureExt> list = null;
		Connection conn = JdbcTemplate.getConnection();
		list = cd.productList(conn, start, end, space,shape);
		close(conn);
		return list;
	}
	
	public int getProductCount(int catenum, int catenum2) {
		int result = 0;
		Connection conn = JdbcTemplate.getConnection();
		result = cd.getProductCount(conn, catenum,catenum2);		
		return result;
	}
	/*
	 * public int insertLike(LikeDTO likey) { Connection conn = getConnection(); int
	 * result = 0; try { result = cd.insertLike(likey); commit(conn); } catch
	 * (Exception e) { rollback(conn); throw e; } finally { close(conn); } return
	 * result; }
	 */



	/*
	 * public int insertLike(LikeBc likeit) { Connection conn = getConnection(); int
	 * result = 0; try { result = cd.insertLike(conn, likeit); commit(conn); } catch
	 * (Exception e) { rollback(conn); throw e; } finally { close(conn); } return
	 * result; }
	 * 
	 * public int deleteLike(LikeBc likeit) { Connection conn = getConnection(); int
	 * result = 0; try { result = cd.deleteLike(conn, likeit); commit(conn); } catch
	 * (Exception e) { rollback(conn); throw e; } finally { close(conn); } return
	 * result; }
	 * 
	 * public List<LikeBc> LikebyMemberId(String memberId) { Connection conn =
	 * getConnection(); List<LikeBc> list = cd.LikebyMemberId(conn, memberId);
	 * close(conn); return list; }
	 */
	/*
	 * public List<LikeDTO> LikeByMemberId(String memberId) { Connection conn =
	 * getConnection(); List<LikeDTO> list = cd.LikeByMemberId(conn, memberId);
	 * close(conn); return list; }
	 */
	
	public List<PictureExt> sortRead(Map<String, Object> param) {
		Connection conn = getConnection();
		List<PictureExt> list = cd.sortRead(conn, param);
		close(conn);
		return list;
	}
	
	public List<PictureExt> sortLike(Map<String, Object> param) {
		Connection conn = getConnection();
		List<PictureExt> list = cd.sortLike(conn, param);
		close(conn);
		return list;
	}
	
	
	
}
