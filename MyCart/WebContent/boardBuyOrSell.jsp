<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.db.BoardDAO"%>
<%@ page import="board.db.BoardDTO"%>
<%@ page import="java.util.ArrayList"%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
%>
<jsp:include page="header.jsp" />
<!-- 글쓰기 기능 -->
<div class="container" id="main">
	<a href="main.jsp"><img src="images/logo-button_tb.png"
		class="img-responsive" id="logo-button" /></a>
		<div class="panel panel-default" class="col-md-12">
			<div class="panel-body" style="text-align: center;">
				<h2>${userID}님의 장바구니</h2>
			</div>
		</div>
		<div>&nbsp;</div>
		<div class="col-md-12 text-center">
			<input class="btn btn-success" value="구매품목 추가" onClick="javascript:window.location='./buy.tb'"> 
			<input class="btn btn-danger" value="판매품목 추가" onClick="javascript:window.location='./sell.tb'"> 
			<input class="btn btn-primary" value="확인하기" onClick="javascript:window.location='./check.tb'">
		</div>
</div>
