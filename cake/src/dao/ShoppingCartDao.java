package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.CakeBean;
import bean.ShoppingCartBean;
import bean.ShoppingCartDetailBean;

public class ShoppingCartDao {
	/**
	 * 初次创建购物车
	 */
	public ShoppingCartBean create(int userId) {
		ShoppingCartBean shoppingCart = new ShoppingCartBean();
		Connection conn = Database.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into shopping_cart(user_id) values(?)";
		ResultSet rs= null;
		try {
			pstmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, userId);
			pstmt.executeUpdate();
			rs = pstmt.getGeneratedKeys();
			while(rs.next()) {
				shoppingCart.setShoppingCartId(rs.getInt(1));
			}
			shoppingCart.setUserId(userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return shoppingCart;
	}
	/**
	 * 根据用户Id查询购物车
	 */
	public ShoppingCartBean getShoppingCartByUserId(int userId) {
		ShoppingCartBean shoppingCart = new ShoppingCartBean();
		Connection conn = Database.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select shopping_cart_id,user_id from shopping_cart where user_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				shoppingCart.setShoppingCartId(rs.getInt(1));
				shoppingCart.setUserId(rs.getInt(2));
				List<ShoppingCartDetailBean> shoppingCartDetailList = new ShoppingCartDetailDao().getShoppingCartDetailByShoppingCartId(rs.getInt(1));
				shoppingCart.setShoppingCartDetailList(shoppingCartDetailList);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return shoppingCart;
	}
	
}
