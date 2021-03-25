<%@page import="sub1.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터베이스 처리 1 ~ 6단계
	String host = "jdbc:mysql://192.168.10.114:3306/keh";
	String user = "keh";
	String pass = "1234";
	
	// 1단계 - JDBC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계 - 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	// 3단계 - SQL 실행 객체 생성
	Statement stmt = conn.createStatement();
	
	// 4단계 - SQL 실행
	String sql = "SELECT * FROM `MEMBER`;";
	ResultSet rs = stmt.executeQuery(sql);
	
	// 5단계 - 실행 결과 처리(SELECT일 경우)
	List<MemberBean> mbList = new ArrayList<>();
	
	while(rs.next()){
		MemberBean mb = new MemberBean();
		
		mb.setUid(rs.getString(1));
		mb.setName(rs.getString(2));
		mb.setHp(rs.getString(3));
		mb.setPos(rs.getString(4));
		mb.setDep(rs.getString(5));
		mb.setRdate(rs.getString(6));
		
		mbList.add(mb);
	}
	
	// 6단계 - 데이터베이스 종료
	rs.close();
	stmt.close();
	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>직원목록</title>
</head>
<body>
	<h3>직원목록</h3>
	
	<a href="./register.jsp">등록하기</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>직급</th>
			<th>부서</th>
			<th>입사일</th>
			<th>관리</th>
		</tr>
		<% for(MemberBean mb : mbList){ 
			String uid   = mb.getUid();
			String name  = mb.getName();
			String hp    = mb.getHp();
			String pos   = mb.getPos();
			String dep   = mb.getDep();
			String rdate = mb.getRdate().substring(2, 10);

		%>
		<tr>
			<td><%= uid %></td>
			<td><%= name %></td>
			<td><%= hp %></td>
			<td><%= pos %></td>
			<td><%= dep %></td>
			<td><%= rdate %></td>
			<td>
				<a href="./modify.jsp?uid=<%= uid %>&name=<%= name %>&hp=<%= hp %>">수정</a>
				<a href="./proc/deleteProc.jsp?uid=<%= uid %>">삭제</a>
			</td>
		</tr>
		<% } %>
	</table>
	
</body>
</html>