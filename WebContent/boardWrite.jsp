<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.db.BoardDAO"%>
<%@ page import="board.db.BoardDTO"%>
<%@ page import="java.util.ArrayList"%>
<link rel="stylesheet" href="css/stylesheet_member.css">
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>
<!-- 글쓰기 기능 -->
<div class="container">
	<div class="row">
		<form method="post" action="./write.tb">
			<table class="table table striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center">${userID}
							님의 쇼핑목록</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="상품명"
							name="boardTitle" maxlength="50" required></td>
						<td><input type="text" class="form-control" placeholder="가격"
							name="boardPrice" maxlength="30" required></td>
						<td><input type="text" class="form-control" placeholder="수량"
							name="boardEa" maxlength="10"></td>
						<td><input type="text" class="form-control" placeholder="쇼핑몰"
							name="boardSeller" maxlength="50"></td>
						<td><input type="text" class="form-control"
							placeholder="쇼핑몰 링크" name="boardSellerLink" maxlength="50"></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">

		</form>
	</div>
</div>
</div>
</div>
