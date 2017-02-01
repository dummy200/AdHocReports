package com.geniisys.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionUtil {

	public static Connection getConnection() throws SQLException {
		/*Connection conn = null;
		Properties connectionProps = new Properties();
		connectionProps.put("user", "CPI");
		connectionProps.put("password", "CPI12345!");

		DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
		conn = (Connection) DriverManager.getConnection("jdbc:oracle:thin:@10.20.39.12:1521:PCIC",connectionProps);
		
		System.out.println("Connected to database");
		return conn;*/
		
		
		
		
		Connection conn = null;
		String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
		try{
			Class.forName(JDBC_DRIVER);
			/*String url = "jdbc:oracle:thin:@10.20.39.12:1521:PCIC";
			conn = DriverManager.getConnection(url, "CPI", "CPI12345!");*/
			String url = "jdbc:oracle:thin:@10.20.39.28:1521:PCIC";
			//String url = "jdbc:oracle:thin:@10.20.39.29:1521:PCIC";
			conn = DriverManager.getConnection(url, "CPI", "CPI.1234");
		return conn;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
	}
}
