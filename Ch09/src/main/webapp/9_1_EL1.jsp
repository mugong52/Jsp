<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>9_1_EL1</title>
</head>
<body>
	<h3>1.표현언어(Expression Language)</h3>
	<%
		String name = "홍길동";
		int num1 = 1;
		int num2 = 2;
		
		// JSP 내장객체 저장 (표현언어를 위한 것)
		pageContext.setAttribute("name", name);
		request.setAttribute("num1", num1);
		session.setAttribute("num2", num2);
	%>
	
	<h4>표현식</h4>
	<p>
		name : <%= name %><br />
		num1 : <%= num1 %><br />
		num2 : <%= num2 %><br />
		num1 + num2 : <%= num1 + num2 %><br />
	</p>
	
	<h4>표현언어</h4>
	<p>
		name : ${name}<br />
		num1 : ${num1}<br />
		num2 : ${num2}<br />
		num1 + num2 : ${num1 + num2}<br />
	</p>
	<!-- 이제는 표현식 대신 표현언어를 사용. 단 표현언어는 JSP 내장객체를 이용해야 함. -->
</body>
</html>