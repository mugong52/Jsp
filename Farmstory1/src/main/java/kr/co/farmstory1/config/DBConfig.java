package kr.co.farmstory1.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	
	// 싱글톤 객체
	private static DBConfig instance = new DBConfig();
	private DBConfig() {}
	
	public static DBConfig getInstance() {
		return instance;
	}
	
	// DB 정보
	private final String HOST = "jdbc:mysql://192.168.10.114:3306/keh";
	private final String USER = "keh";
	private final String PASS = "1234";
	
	public Connection getConnection() throws Exception {
		
		// DB 처리 1단계 - JDBC 드라이버 로드
		Class.forName("com.mysql.jdbc.Driver");
		
		// DB 처리 2단계 - 데이터베이스 접속
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		return conn;
	}

}
