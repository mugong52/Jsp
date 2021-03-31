<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserBean user = (UserBean)session.getAttribute("suser");

	if(user != null){
		// 로그인 상태이면
		pageContext.forward("./list.jsp");
		// forward는 시스템 경로가 아닌 상대 경로를 써야 작동
	}else{
		// 로그인 상태가 아니면
		pageContext.forward("./user/login.jsp");
	}
%>