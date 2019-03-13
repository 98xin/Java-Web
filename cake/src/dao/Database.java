package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
	//获取对数据库的连接
	public static Connection getConnection() {
		Connection conn = null;
		try {
			//1. 加载驱动
			Class.forName("com.mysql.jdbc.Driver");
			//2. 建立连接
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/cake?useUnicode=true&characterEncoding=utf-8","root","");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
}
