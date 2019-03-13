package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.CakeBean;

public class CakeDao {
	/**
	 * 根据蛋糕Id查询蛋糕
	 */
	public CakeBean getCakeById(int cakeId) {
		CakeBean cake = new CakeBean();
		Connection conn = Database.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select cake_id, cake_name,type,size,price,pic,s1,s2,s3,introduce from cake where cake_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cakeId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				cake.setCakeId(cakeId);
				cake.setCakeName(rs.getString(2));
				cake.setType(rs.getString(3));
				cake.setSize(rs.getInt(4));
				cake.setPrice(rs.getDouble(5));
				cake.setPath(rs.getString(6));
				cake.setSmallpicture1(rs.getString(7));
				cake.setSmallpicture2(rs.getString(8));
				cake.setSmallpicture3(rs.getString(9));
				cake.setIntroduce(rs.getString(10));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return cake;
	}
	/**
	 * 查询所有数据
	 */
	public List<CakeBean> getAllData(){
		List<CakeBean> cakeList = new ArrayList<CakeBean>();
		Connection conn = Database.getConnection();
		PreparedStatement pstmt = null;
		String sql = "select cake_id, cake_name,type,size,price,pic,s1,s2,s3,introduce from cake";
		ResultSet rs = null;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CakeBean cake = new CakeBean();
				cake.setCakeId(rs.getInt(1));
				cake.setCakeName(rs.getString(2));
				cake.setType(rs.getString(3));
				cake.setSize(rs.getInt(4));
				cake.setPrice(rs.getDouble(5));
				cake.setPath(rs.getString(6));
				cake.setSmallpicture1(rs.getString(7));
				cake.setSmallpicture2(rs.getString(8));
				cake.setSmallpicture3(rs.getString(9));
				cake.setIntroduce(rs.getString(10));
				cakeList.add(cake);
			}
			//conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cakeList;
	}
	
}
