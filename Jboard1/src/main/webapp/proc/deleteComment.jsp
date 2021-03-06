<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 인코딩
	request.setCharacterEncoding("UTF-8");

	// 전송 데이터 수신
	String seq = request.getParameter("seq");
	String parent = request.getParameter("parent");
	
	// DB 처리 - 댓글 삭제
	ArticleDao dao = ArticleDao.getInstance();
	dao.deleteComment(seq);
	
	// DB 처리 - 원글 댓글 카운트 -1
	dao.updateArticleCommentDec(parent);
	
	// 리다이렉트
	response.sendRedirect("/Jboard1/view.jsp?seq="+parent);
%>