<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터 인코딩 (한글 안 깨지게)
	request.setCharacterEncoding("UTF-8");

	// 데이터(parameter) 수신
	String name		 = request.getParameter("name");
	String gender	 = request.getParameter("gender");
	String[] hobbies = request.getParameterValues("hobby");
	String addr 	 = request.getParameter("addr");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>RegisterProc</title>
</head>
<body>
	<h3>회원가입 결과</h3>
	<table border="1">
		<tr>
			<td>이름</td>
			<td><%= name %></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<%
					if(gender.equals("1")){ // 문자열 비교는 equals로
						out.print("남자");
					}else{
						out.print("여자");
					}
				%>
			</td>
		</tr>
		<tr>
			<td>취미</td>
			<td>
				<%
					for(String hobby : hobbies){
						out.print(hobby+", ");
					}
				%>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%= addr %></td>
		</tr>
	</table>
	<a href="../3_1_Request.jsp">뒤로가기</a>
</body>
</html>