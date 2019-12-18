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
<form method="post" action="./write.tb">
	<a href="main.jsp"><img src="images/logo-button_tb.png"
		class="img-responsive" id="logo-button" /></a>
		<div class="panel panel-default" class="col-md-12">
			<div class="panel-body" style="text-align: center;">
				<h2>${userID}님의장바구니</h2>
			</div>
		</div>
		<div>&nbsp;</div>
		<div class="col-md-12 text-center">
			<input type="submit" class="btn	btn-success" value="추가하기"> <input
				class="btn btn-primary" value="확인하기"
				onClick="javascript:window.location='./check.tb'">
		</div>
		<div>&nbsp;</div>
		<div>&nbsp;</div>
		<table class="table table striped action"
			style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr colspan="2">
					<td><input type="text" class="form-control" placeholder="상품명"
						name="boardTitle" maxlength="50"></td>
					<td><input type="text" class="form-control" placeholder="가격"
						name="boardPrice" maxlength="30"></td>
					<td><input type="text" class="form-control" placeholder="개수"
						name="boardEa" maxlength="10"></td>
					<td><input type="text" class="form-control"
						placeholder="쇼핑몰 링크" name="boardSellerLink" maxlength="50"></td>
					<td><input type="text" class="form-control" placeholder="메모"
						name="boardMemo" maxlength="50"></td>
					<td><input type="text" class="form-control" placeholder="태그"
						name="boardTag" maxlength="50"></td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
