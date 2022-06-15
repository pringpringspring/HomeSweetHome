package community.model.dao;
import static common.JdbcTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import community.model.dto.Attachment;
import community.model.dto.Knowhow;
import community.model.dto.KnowhowComment;
import community.model.dto.KnowhowExt;
import community.model.exception.QnaBoardException;
import community.model.exception.QnaNoticeException;


public class KnowhowDao {
	private Properties prop = new Properties();

	public KnowhowDao() {
	String fileName = QnaNoticeDao.class.getResource("/sql/knowhow-query.properties").getPath();
	try {
		prop.load(new FileReader(fileName));
	} catch (IOException e) {
		e.printStackTrace();
	}
	}
	
	public List<KnowhowExt> findAll(Connection conn,Map<String,Object> param){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<KnowhowExt> list = new ArrayList<>();
		String sql = prop.getProperty("findAll");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (int) param.get("start"));
			pstmt.setInt(2, (int) param.get("end"));
			rset = pstmt.executeQuery();
			while(rset.next()) {
				KnowhowExt board = handleBoardResultSet(rset);
				board.setAttachCount(rset.getInt("attach_cnt"));
				board.setCommentCount(rset.getInt("comment_cnt"));
				list.add(board);
			}
			
		} catch (Exception e) {
			throw new QnaBoardException("글 목록 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	private KnowhowExt handleBoardResultSet(ResultSet rset) throws SQLException {
		KnowhowExt kh = new KnowhowExt();
		kh.setNo(rset.getInt("knowhow_board_no"));
		kh.setMemberId(rset.getString("member_id"));
		kh.setCategoryNo(rset.getInt("theme_category_no"));
		kh.setContent(rset.getString("content"));
		kh.setReadCount(rset.getInt("read_count"));
		kh.setLikeCount(rset.getInt("like_count"));
		kh.setRegDate(rset.getDate("reg_date"));
		kh.setNickName(rset.getString("nickname"));
		kh.setTitle(rset.getString("title"));
		kh.setCoverPhoto(rset.getString("cover_photo"));
		return kh;
	}
	
	public int getTotalContents(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalContents = 0;
		String sql = prop.getProperty("getTotalContents");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				totalContents = rset.getInt(1);
			}
		} catch (Exception e) {
			throw new QnaBoardException("총 게시물수 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContents;
	}
	
	public int insertBoard(Connection conn, Knowhow kh) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertBoard");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kh.getMemberId());
			pstmt.setString(2, kh.getNickName());
			 pstmt.setInt(3, kh.getCategoryNo()); 
			pstmt.setString(4, kh.getContent());
			pstmt.setString(5, kh.getTitle());
			pstmt.setString(6, kh.getCoverPhoto());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new QnaBoardException("노하우 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int findCurrentBoardNo(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int no = 0;
		String sql = prop.getProperty("findCurrentBoardNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next())
				no = rset.getInt(1);
			
		} catch (SQLException e) {
			throw new QnaBoardException("게시글 번호 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return no;
	}
	
	//첨부파일 등록
		public int insertAttachment(Connection conn, Attachment attach) {
			PreparedStatement pstmt = null;
			int result = 0;
			String sql = prop.getProperty("insertAttachment");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, attach.getBoardNo());
				pstmt.setString(2, attach.getOriginalFilename());
				pstmt.setString(3, attach.getRenamedFilename());
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				throw new QnaBoardException("첨부파일 등록 오류", e);
			} finally {
				close(pstmt);
			}
			return result;
		}
		
		public KnowhowExt findByNo(Connection conn, int no) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			KnowhowExt board = null;
			String sql = prop.getProperty("findByNo");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				rset = pstmt.executeQuery();
				while(rset.next()) {
					board = handleBoardResultSet(rset);
				}
			} catch (SQLException e) {
				throw new QnaBoardException("게시글 한건 조회 오류", e);
			} finally {
				close(rset);
				close(pstmt);
			}	
			return board;
		}
		
		public List<Attachment> findAttachmentByBoardNo(Connection conn, int no) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			List<Attachment> attachments = new ArrayList<>();
			String sql = prop.getProperty("findAttachmentByBoardNo");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				rset = pstmt.executeQuery();
				while(rset.next()) {
					Attachment attach = handleAttachmentResultSet(rset);
					attachments.add(attach);
				}
			} catch (SQLException e) {
				throw new QnaBoardException("게시글 번호에 의한 첨부파일조회 오류", e);
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return attachments;
		}

		private Attachment handleAttachmentResultSet(ResultSet rset) throws SQLException {
			Attachment att = new Attachment();
			att.setNo(rset.getInt("no"));
			att.setBoardNo(rset.getInt("knowhow_no"));
			att.setOriginalFilename(rset.getString("original_filename"));
			att.setRenamedFilename(rset.getString("renamed_filename"));
			return att;
		}

		//조회수
		public int updateReadCount(Connection conn, int no) {
			PreparedStatement pstmt = null;
			int result = 0;
			String sql = prop.getProperty("updateReadCount");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				throw new QnaBoardException("조회수 증가처리 오류", e);
			} finally {
				close(pstmt);
			}
			return result;
		}
		
		//첨부파일 조회
		public Attachment findAttachmentByNo(Connection conn, int no) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			Attachment attach = null;
			String sql = prop.getProperty("findAttachmentByNo");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				rset = pstmt.executeQuery();
				if(rset.next()) 
					attach = handleAttachmentResultSet(rset);
					
			} catch (SQLException e) {
				throw new QnaBoardException("첨부파일 조회 오류", e);
			} finally {
				close(rset);
				close(pstmt);
			}
			return attach;
		}
		public int deleteBoard(Connection conn, int no) {
			int result = 0;
			PreparedStatement pstmt = null;
			String query = prop.getProperty("deleteBoard");

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, no);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				throw new QnaBoardException("게시글 삭제 오류", e);
			} finally {
				close(pstmt);
			}

			return result;
		}

		public int updateBoard(Connection conn, KnowhowExt board) {
			PreparedStatement pstmt = null;
			int result = 0;
			String sql = prop.getProperty("updateBoard");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, board.getTitle());
				pstmt.setString(2, board.getContent());
				pstmt.setInt(3, board.getNo());
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				throw new QnaBoardException("게시글 수정 오류", e);
			} finally {
				close(pstmt);
			}
			return result;
		}
		
		public int deleteAttachment(Connection conn, int no) {
			int result = 0;
			PreparedStatement pstmt = null;
			String query = prop.getProperty("deleteAttachment");

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, no);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				throw new QnaBoardException("첨부파일 삭제 오류", e);
			} finally {
				close(pstmt);
			}
			return result;
		}
		
		public int insertBoardComment(Connection conn, KnowhowComment kc) {
			int result = 0;
			PreparedStatement pstmt = null;
			String query = prop.getProperty("insertBoardComment");

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, kc.getKnowhowNo());
				pstmt.setString(2, kc.getMemberId());
				pstmt.setString(3, kc.getNickName());
				pstmt.setString(4, kc.getContent());
				pstmt.setInt(5, kc.getCommentLevel());
				pstmt.setObject(6, kc.getCommentRef() == 0 ? null : kc.getCommentRef());

				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				throw new QnaBoardException("댓글 등록 오류", e);
			} finally {
				close(pstmt);
			}
			return result;
		}

		
		public List<KnowhowComment> findBoardCommentByBoardNo(Connection conn, int no) {
	
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			List<KnowhowComment> comments = new ArrayList<>();
			String sql = prop.getProperty("findBoardCommentByBoardNo");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				rset = pstmt.executeQuery();
				while(rset.next()) {
					KnowhowComment kc = new KnowhowComment();
					kc.setNo(rset.getInt("comment_no"));
					kc.setCommentLevel(rset.getInt("comment_level"));
					kc.setCommentRef(rset.getInt("comment_ref"));
					kc.setKnowhowNo(rset.getInt("knowhow_board_no"));
					kc.setMemberId(rset.getString("member_id"));
					kc.setNickName(rset.getString("nickname"));
					kc.setContent(rset.getString("content"));
					kc.setLikeCount(rset.getInt("like_count"));
					kc.setRegDate(rset.getDate("reg_date"));
					comments.add(kc);
				}
				
			} catch (SQLException e) {
				throw new QnaBoardException("노하우 댓글 목록 조회 오류", e);
			} finally {
				close(rset);
				close(pstmt);
			}
			return comments;
		}
		
		public int deleteBoardComment(Connection conn, int no) {
			PreparedStatement pstmt = null;
			int result = 0;
			String sql = prop.getProperty("deleteBoardComment");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				throw new QnaBoardException("댓글 삭제 오류", e);
			} finally {
				close(pstmt);
			}
			return result;
		}
		
		// 댓글 수
		/*
		 * public int commentCount(Connection conn, int no) { List<QnaBoardComment> list
		 * = new ArrayList<>(); QnaBoardComment bc = null; PreparedStatement pstmt =
		 * null; ResultSet rset = null; String sql = prop.getProperty("commentCount");
		 * 
		 * try { pstmt = conn.prepareStatement(sql); pstmt.setInt(1, no); rset =
		 * pstmt.executeQuery(); while (rset.next()) { bc = new Comment();
		 * 
		 * bc.setNo(rset.getInt("comment_no"));
		 * bc.setCommentLevel(rset.getInt("comment_level"));
		 * bc.setBoardNo(rset.getInt("board_no"));
		 * bc.setMemberId(rset.getString("member_id"));
		 * bc.setNickName(rset.getString("nickname"));
		 * bc.setContent(rset.getString("content"));
		 * bc.setCommentRef(rset.getInt("comment_ref"));
		 * bc.setLikeCnt(rset.getInt("like_count"));
		 * bc.setRegDate(rset.getDate("reg_date"));
		 * 
		 * list.add(bc); }
		 * 
		 * } catch (SQLException e) { e.printStackTrace(); }
		 * 
		 * return list.size(); }
		 */

	
}
