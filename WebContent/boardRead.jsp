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
%><!-- 저장 목록 -->
<div class="container">
	<div class="row">
			<table class="table table striped"
				style="text-align: center; border: 1px solid #dddddd">
				<tbody>
		<%
			BoardDAO boardDAO = new BoardDAO();
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>(); 
			list = boardDAO.read(pageNumber, userID);
			for (int i = 0; i < list.size(); i++) {
		%>
		<tr>
			<td><%=list.get(i).getBoardID()%></td>
			<td><%=list.get(i).getBoardTitle()%></td>
			<td><%=list.get(i).getBoardPrice()%></td>
			<td><%=list.get(i).getBoardEa()%></td>
			<td><%=list.get(i).getBoardSeller()%></td>
			<td><%=list.get(i).getBoardSellerLink()%></td>
			<td><%=list.get(i).getBoardDate().toLocalDateTime().toString().substring(0, 15)%></td>
		</tr>
		<%
			}
		%>
				</tbody>
			</table>
			<%
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
			<input type="submit" class="btn btn-primary pull-right" value="삭제">
	</div>
</div>
</div>
</div>
