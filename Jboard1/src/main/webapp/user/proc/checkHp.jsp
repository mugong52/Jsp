<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//전송 데이터 인코딩
	request.setCharacterEncoding("UTF-8");

	// 전송 데이터 수신
	String hp	 = request.getParameter("hp");
	
	// 1, 2단계
	Connection conn = DBConfig.getInstance().getConnection();
	
	// 3단계 - SQL 실행 객체 생성
	Statement stmt = conn.createStatement();
	
	// 4단계 - SQL 실행
	String sql = "SELECT COUNT(`hp`) FROM `JBOARD_USER` WHERE `hp`='"+hp+"'";
	ResultSet rs  = stmt.executeQuery(sql);
	
	// 5단계 - 실행 결과 처리(SELECT일 경우)
	int count = 0;
	
	if(rs.next()){
		count = rs.getInt(1);
	}
	
	// 6단계 - 데이터베이스 종료
	rs.close();
	stmt.close();
	conn.close();
	
	// 결과값 json 형태로 리턴
	JsonObject json = new JsonObject();
	json.addProperty("result", count);
	
	out.print(json);
%>