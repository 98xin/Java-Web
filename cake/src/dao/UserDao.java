package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.UserBean;

public class UserDao {
	/**
	 * 通过name查询用户
	 */
	public UserBean getUserByName(String username) {
		UserBean user = new UserBean();
		Connection conn = Database.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select user_id,user_name,password,email from user where user_name = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				user.setUserId(rs.getInt(1));
				user.setUsername(username);
				user.setPassword(rs.getString(3));
				user.setEmail(rs.getString(4));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return user;
	}
	/**
	 * 插入一条数据
	 */
	public boolean insertUser(String name,String pwd,String email) {
		UserBean user = new UserBean();
		Connection conn = Database.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into user(user_name,password,email) values(?,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, pwd);
			pstmt.setString(3, email);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return true;
	}
	/**
	 * 查找所有的用户
	 * @return
	 */
	public List<UserBean> findAll() {
		List<UserBean> list = new ArrayList<>();
		Connection conn = Database.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt=conn.prepareStatement("select * from user");
			rs=pstmt.executeQuery();
			while (rs.next()) {
				UserBean users=new UserBean();
				users.setUsername(rs.getString(2));
				users.setPassword(rs.getString(3));
				users.setEmail(rs.getString(4));
				list.add(users);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
	}
	
	
}
