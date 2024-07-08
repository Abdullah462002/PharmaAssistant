package com.pharma.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pharma.bean.User;
import com.pharma.constants.QueryConstants;
import com.pharma.util.DbUtil;



public class LoginDao {

	public User userValidation(User u) {
		Connection conn= DbUtil.getConnection();
		User us= null;
		try(PreparedStatement ps= conn.prepareStatement(QueryConstants.LOGINSQL);) {
			ps.setString(1, u.name());
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				us=new User(u.name(),rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return us;
	}
	
}
