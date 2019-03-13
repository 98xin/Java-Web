package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.PreparedStatement;

import bean.CakeTypeBean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;



public class CakeTypeDao {
/*	HashMap<Integer, List<CakeTypeBean>> hsmap=new HashMap<Integer, List<CakeTypeBean>>();
	
	public HashMap<Integer, List<CakeTypeBean>> findAll() {
		CakeTypeBean c=new CakeTypeBean();
		Connection conn = Database.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select type_id,type_name,pid  from type";
		try{			
			pstmt=(PreparedStatement) conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				c.setTypeId(rs.getInt(1));
				c.setTypeName(rs.getString(2));
				c.setpId(rs.getInt(3));
				if (hsmap.containsKey(rs.getInt(3))) {
					hsmap.get(rs.getInt(3)).add(c);
				} else {
					List<CakeTypeBean> list=new ArrayList<CakeTypeBean>();
					list.add(c);
					hsmap.put(rs.getInt(3), list);
				}
			}
			conn.close();
			return hsmap;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}

	}*/
public List<CakeTypeBean> findAll() {
	
	Connection conn = Database.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select type_id,type_name,pid from type";
	List<CakeTypeBean> list = new ArrayList<CakeTypeBean>();
	try {
		pstmt=(PreparedStatement) conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while (rs.next()) {
			CakeTypeBean c=new CakeTypeBean();
			c.setTypeId(rs.getInt(1));
			c.setTypeName(rs.getString(2));
			c.setpId(rs.getInt(3));
			list.add(c);
		}
		pstmt.close();
		return list;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return null;
	} 
}

}
