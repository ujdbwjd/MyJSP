package com.kb.org;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionPool {
	private static Connection conn = null;
	
	public static Connection getConnection() {
		if(conn != null) {
			return conn;
		} else {
			try {
				Context initContext = (Context) new InitialContext().lookup("java:comp/env/");
				DataSource ds = (DataSource) initContext.lookup("jdbc/mysql");
				conn = ds.getConnection();
			} catch(Exception e) {
				e.printStackTrace();
			}
			return conn;
		}
	}
}
