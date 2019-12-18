<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp" />
<%-- header 의 session 별도 처리 --%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.db.BoardDAO"%>
<%@ page import="board.db.BoardDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.*"%>
<%
	BoardDTO board = (BoardDTO)request.getAttribute("boardDTO");
%>
<link rel="stylesheet" href="css/stylesheet_board.css">
<!-- 글쓰기 기능 -->
<div class="container" id="main">
	<img src="images/logo-button_tb.png" class="img-responsive"
		id="logo-button" />
	<form method="post" action="./update.tb?boardID=<%=board.getBoardID() %>">
	<!-- 파라미터 -->
	<input type="hidden" name="num" value=<%=board.getBoardID() %>>
 		<div class="panel panel-default" class="col-md-12">
		</div>
		<div>&nbsp;</div>
		<div class="col-md-12 text-center">
			<input class="btn btn-primary" value="돌아가기" onClick="location.href='./check.tb'">
			<input class="btn btn-warning" value="수정하기" onClick="location.href='./update.tb?boardID=<%=board.getBoardID()%>'">
			<input class="btn btn-danger" value="삭제하기" onClick="location.href='./delete.tb?boardID=<%=board.getBoardID()%>'">
		</div>
		<div>&nbsp;</div>
		<div>&nbsp;</div>
		<table class="table table striped action"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
			<tr>
			<th colspan="12" style="text-align: center; background-color: #333333; color: #eeeeee">수정 중</th>
			</tr>
			</thead>
			<tbody>
				<tr colspan="2">
					<td><%=board.getBoardType() %></td>
					<td><%=board.getBoardTitle() %></td>
					<td><%=board.getBoardPrice() %></td>
					<td><%=board.getBoardEa() %></td>
					<td><%=board.getBoardSellerLink() %></td>
					<td><%=board.getBoardMemo() %></td>
					<td><%=board.getBoardTag() %></td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
	