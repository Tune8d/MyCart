<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp" />
<%-- header 의 session 별도 처리 --%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.db.BoardDAO"%>
<%@ page import="board.db.BoardDTO"%>
<%@ page import="java.util.ArrayList"%>
<link rel="stylesheet" href="css/stylesheet_board.css">

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
<div class="container" id="main">
<img src="images/logo-button_tb.png" class="img-responsive" id="logo-button" />
		<form method="post" action="./write.tb">
				<div class="panel panel-default" class="col-md-12">
					<div class="panel-body" style="text-align: center;">
						<h2>${userID}님의 장바구니</h2>
					</div>
				</div>
			<div>&nbsp;</div>
			<div class="col-md-12 text-center">
				<input type="submit" class="btn	 btn-success" value="추가하기">
				<input class="btn btn-primary" value="확인하기" onClick="javascript:window.location='./check.tb'">
<!-- 				<input type="submit" class="btn btn-warning" value="수정하기">
				<input type="submit" class="btn btn-danger" value="삭제하기">
 -->			</div>
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
						<td><a href="#" data-toggle="tooltip" title="#으로 태그 중복 적용	 가능"><input type="text" class="form-control" placeholder="태그"
							name="boardTag" maxlength="50"></a></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>
</div>
</div>
<!-- 본문 끝 -->
<jsp:include page="footer.jsp" />
