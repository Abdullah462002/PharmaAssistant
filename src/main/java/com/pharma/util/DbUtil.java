package com.pharma.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DbUtil {
	
	private static Connection conn =null;
	private DbUtil() { //Singleton Pattern.
		
	}

	public static Connection getConnection() {
		if(conn==null) {
			try {
				Properties pr = new Properties();
				pr.load(DbUtil.class.getClassLoader().getResourceAsStream("db.properties"));
				Class.forName(pr.getProperty("driver"));
				conn=DriverManager.getConnection(pr.getProperty("url"),pr.getProperty("username"),pr.getProperty("password"));
				return conn;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}else {
			return conn;
		}		
	}
}
