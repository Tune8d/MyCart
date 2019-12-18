<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp" />
<%-- header 의 session 별도 처리 --%>
<%@ page import="board.db.BoardDAO"%>
<%@ page import="board.db.BoardDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<link rel="stylesheet" href="css/stylesheet_board.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<%
	BoardDTO boardDTO = (BoardDTO) request.getAttribute("data");
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>
<script>
	function listenForDoubleClick(element) {
		element.contentEditable = true;
		setTimeout(function() {
			if (document.activeElement !== element) {
				element.contentEditable = false;
			}
		}, 300);
	}

	function listenForDoubleClickLink(element) {
		document.getElementById("hl").innerHTML = document.getElementById('hl').getAttribute('href');
		element.contentEditable = true;
		setTimeout(function() {
			if (document.activeElement !== element) {
				element.contentEditable = false;
			}	
		}, 300);	
	}
</script>
<!-- 글쓰기 기능 -->
<div class="container" id="main">
	<form method="post" action="./write.tb">
		<img src="images/logo-button_tb.png" class="img-responsive"
			id="logo-button" />

		<div class="panel panel-default" class="col-md-12">
			<div class="panel-body" style="text-align: center;">
				<h2>${userID}님의장바구니</h2>
			</div>
		</div>
		<div>&nbsp;</div>
		<div class="col-md-12 text-center">
			<input type="submit" class="btn	 btn-success" value="추가하기">
			<input class="btn btn-primary" value="확인하기"
				onClick="javascript:window.location='./check.tb'">
			<!-- 목록 원페이지화 같은거라면 추가 -->
			<!-- 				<input type="submit" class="btn btn-warning" value="수정하기">  클라이언트 처리가 좋을듯.-->
		</div>
		<div>&nbsp;</div>
		<div>&nbsp;</div>
		<table class="table table striped action"
			style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr colspan="2">
					<td class="dropdown">
						<%-- td 안에 div 섞이면 잘 안된다. --%> <select name="boardType">
							<option>BUY</option>
							<%-- value 가 없어야 box 값이 들어간다..	 --%>
							<option>SELL</option>
					</select>
					</td>
					<td><input type="text" class="form-control" placeholder="상품명"
						name="boardTitle" maxlength="50"></td>
					<td><input type="text" class="form-control"
						placeholder="매수희망가  or 매도희망가" name="boardPrice" maxlength="30"></td>
					<td><input type="text" class="form-control"
						placeholder="최저매수가 or 최고매도가" name="boardEa" maxlength="10"></td>
					<td><input type="text" class="form-control"
						placeholder="#검색필터" name="boardMemo" maxlength="50"></td>
					<td><input type="text" class="form-control"
						placeholder="#포트폴리오 tag" name="boardTag" maxlength="50"></td>
					<td><input type="text" class="form-control"
						placeholder="쇼핑몰 링크" name="boardSellerLink" maxlength="50"></td>
				</tr>
				<tr colspan="2'" id="result">
					<td><%=boardDTO.getBoardType() %></td>
					<td><%=boardDTO.getBoardTitle()%></td>
					<td><%=boardDTO.getBoardPrice()%></td>
					<td onclick="listenForDoubleClick(this);"
						onblur="this.contentEditable=false;"><%=boardDTO.getBoardEa()%></td>
					<td onclick="listenForDoubleClick(this);"
						onblur="this.contentEditable=false;"><%=boardDTO.getBoardMemo()%></td>
					<td onclick="listenForDoubleClick(this);"
						onblur="this.contentEditable=false;"><%=boardDTO.getBoardTag()%></td>
					<td onclick="listenForDoubleClickLink(this);"
						onblur="this.contentEditable=false;"><a id="hl"
						href="http://<%=boardDTO.getBoardSellerLink()%>">Link</a></td>
				</tr>
			</tbody>
		</table>

	</form>
</div>

