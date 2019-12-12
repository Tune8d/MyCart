<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="board.db.BoardDAO"%>
<%@ page import="board.db.BoardDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<link rel="stylesheet" href="css/stylesheet_member.css">
<%
	BoardDTO board = (BoardDTO) request.getAttribute("data");
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>
<div class="container">
	<div class="row">
		<form method="post" action="./write.tb">
			<table class="table table striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center">게시판
							글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						<td><input type="text" class="form-control"
							placeholder="게시판 번호" name="BoardID" maxlength="50" required></td>
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
				<tbody>

					<%-- 	<%
         BoardDAO boardDAO = new BoardDAO();
         ArrayList<BoardDTO> list = new ArrayList<BoardDTO>(); 
         list = boardDAO.read(pageNumber, userID);
         for (int i = 0; i < list.size(); i++) {
      %> --%>
					<tr>
						<td><%=board.getBoardID()%></td>
						<td><%=board.getBoardTitle()%></td>
						<td><%=board.getBoardPrice()%></td>
						<td><%=board.getBoardEa()%></td>
						<td><%=board.getBoardSeller()%></td>
						<td><a href="<%=board.getBoardSellerLink()%>">Link</a></td>
					</tr>

				</tbody>
			</table>
					<a href="./delete.jsp"> 삭제하기 </a>&nbsp;&nbsp;
				
				<%
					BoardDAO boardDAO = new BoardDAO();

					if (pageNumber != 1) {
				%>
				<a href="board.jsp?pageNumber=<%=pageNumber - 1%>"
					class="btn btn-success btn-arrow-left">이전</a>
				<% 
					}
					if (boardDAO.nextPage(pageNumber + 1)) {
				%>
				<a href="board.jsp?pageNumber=<%=pageNumber + 1%>"
					class="btn btn-success btn-arrow-right">이전</a>
				<%
					}
				%>
			</form>
	</div>
</div>
