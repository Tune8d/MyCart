<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" /> <%-- header 의 session 별도 처리 --%>
<link rel="stylesheet" href="css/stylesheet_member.css">
 <!-- 본문 시작  -->       
 	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
	%>
<jsp:include page="board.jsp"/> 	
	<%
		}
	%>
 <!-- 본문 끝 -->
<jsp:include page="footer.jsp"/>