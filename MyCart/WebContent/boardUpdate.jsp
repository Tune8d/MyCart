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
<script>
function checkNull(){
	 
	var id0= document.getElementById("0").value; 
	var id1= document.getElementById("1").value;
	var id2= document.getElementById("2").value;
	var id3= document.getElementById("3").value;
	var id4= document.getElementById("4").value;
	var id5= document.getElementById("5").value;
	var id6= document.getElementById("6").value; 

	if(id0 === "" || id1 === "" || id2 === "" || id3 === "" || id4 === "" || id5 === "" || id6 === ""){
		alert('값을 다 입력해주세요');
	}else{
		document.modifyform.submit();
	}
		
}
</script>
<link rel="stylesheet" href="css/stylesheet_board.css">
<!-- 글쓰기 기능 -->
<div class="container" id="main">
	<img src="images/logo-button_tb.png" class="img-responsive"
		id="logo-button" />
	<form action="updateAction.tb" method="post" name="modifyform">
		<div class="panel panel-default" class="col-md-12"></div>
		<!-- name 값이 곧 파라미터 키값이다..... -->
		<input type="hidden" value=<%=board.getBoardID()%> name="boardID">
		<div>&nbsp;</div>
		<div class="col-md-12 text-center">
			<input class="btn btn-primary" value="돌아가기"
				onClick="javascript:history.back()"> <input 
				class="btn	btn-success" value="수정하기" onClick="checkNull()">
		</div>
		<div>&nbsp;</div>
		<div>&nbsp;</div>
		<table class="table table striped action"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="12"
						style="text-align: center; background-color: #333333; color: #eeeeee">수정
						중</th>
				</tr>
			</thead>
			<tbody>
				<tr colspan="2">
					<td class="dropdown"><select name="boardType" id="0" required>
						    <option value="<%=board.getBoardType() %>" selected>Please Choose...</option>
							<option>BUY</option>
							<option>SELL</option>
					</select></td>
					<td><input type="text" class="form-control"
						placeholder="<%=board.getBoardTitle() %>" name="boardTitle"
						maxlength="50" id="1"></td>
					<td><input type="text" class="form-control"
						placeholder="<%=board.getBoardPrice() %>" name="boardPrice"
						maxlength="30" id="2"></td>
					<td><	input type="text" class="form-control"
						placeholder="<%=board.getBoardEa() %>" name="boardEa"
						maxlength="10" id="3"></td>
					<td><input type="text" class="form-control"
						placeholder="<%=board.getBoardMemo() %>" name="boardMemo"
						maxlength="50" id="4"></td>
					<td><input type="text" class="form-control"
						placeholder="<%=board.getBoardTag() %>" name="boardTag"
						maxlength="50" id="5"></td>
					<td><input type="text" class="form-control"
						placeholder="<%=board.getBoardSellerLink() %>"
						name="boardSellerLink" maxlength="50" id="6"></td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<!-- 본문 끝 -->
