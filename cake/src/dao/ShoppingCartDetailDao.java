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

public class ShoppingCartDetailDao {
	public ShoppingCartDetailBean add(int shoppingCartId,int cakeId,int count) {
		ShoppingCartDetailBean shoppingCartDetail = new ShoppingCartDetailBean();
		Connection conn = Database.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="insert into shopping_cart_detail(shopping_cart_id,cake_id,count) values(?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1,shoppingCartId);
			pstmt.setInt(2,cakeId);
			pstmt.setInt(3,count);
			pstmt.executeUpdate();
			rs = pstmt.getGeneratedKeys();
			while(rs.next()) {
				shoppingCartDetail.setShoppingCartDetailId(rs.getInt(1));
			}
			CakeBean cake = new CakeDao().getCakeById(rs.getInt(cakeId));
			shoppingCartDetail.setCake(cake);
			shoppingCartDetail.setCount(rs.getInt(3));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return shoppingCartDetail;
	}
	/**
	 * 根据购物车Id查询明细
	 */
	public List<ShoppingCartDetailBean> getShoppingCartDetailByShoppingCartId(int shoppingCartId) {
		List<ShoppingCartDetailBean> shoppingCartDetailList = new ArrayList<ShoppingCartDetailBean>();
		ShoppingCartBean shoppingCart = new ShoppingCartBean();
		Connection conn = Database.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select shopping_cart_detail_id,shopping_cart_id,cake_id,count,addtime from shopping_cart_detail where shopping_cart_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, shoppingCartId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ShoppingCartDetailBean detail = new ShoppingCartDetailBean();
				detail.setShoppingCartDetailId(rs.getInt(1));
				detail.setShoppingCartId(rs.getInt(2));
				CakeBean cake = new CakeDao().getCakeById(rs.getInt("cake_id"));
				detail.setCake(cake);
				detail.setCount(rs.getInt("count"));
				detail.setAddtime(rs.getDate("addtime"));
				shoppingCartDetailList.add(detail);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return shoppingCartDetailList;
	}
	
}
