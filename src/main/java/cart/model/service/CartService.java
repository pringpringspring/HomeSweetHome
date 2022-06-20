package cart.model.service;

import static common.JdbcTemplate.close;
import static common.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import cart.model.dao.CartDao;
import cart.model.dto.Cart;


public class CartService {
	public static final int NUM_PER_PAGE = 10;
	private CartDao cartDao = new CartDao();

	public List<Cart> findCartsByMemberId(String memberId) {
		Connection conn = getConnection();
		List<Cart> carts = cartDao.findCartsByMemberId(conn, memberId);
		close(conn);
		return carts;
	}
	
	
}
