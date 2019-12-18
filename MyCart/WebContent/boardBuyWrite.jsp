<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.db.BoardDAO"%>
<%@ page import="board.db.BoardDTO"%>
<%@ page import="java.util.ArrayList"%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
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
		document.writeForm.submit();
	}
		
}
</script>
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
%>
<jsp:include page="header.jsp" />
<!-- 글쓰기 기능 -->
<div class="container" id="main">
<form method="post" action="./write.tb" name="writeForm">
	<a href="main.jsp"><img src="images/logo-button_tb.png"
		class="img-responsive" id="logo-button" /></a>
		<div class="panel panel-default" class="col-md-12">
			<div class="panel-body" style="text-align: center;">
				<h2>${userID}님의 장바구니</h2>
			</div>
		</div>
		<div>&nbsp;</div>
		<div class="col-md-12 text-center">
			<input class="btn	btn-success" value="추가하기" onClick="checkNull()"> <input
				class="btn btn-primary" value="확인하기"
				onClick="javascript:window.location='./check.tb'">
		</div>
		<div>&nbsp;</div>
		<div>&nbsp;</div>
		<table class="table table striped action"
			style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr colspan="2">
					<td><input type="text" class="form-control" value="BUY"
						name="boardType" maxlength="50" id="0" readonly></td>
					<td><input type="text" class="form-control" placeholder="상품명"
						name="boardTitle" maxlength="50" id="1"></td>
					<td><input type="text" class="form-control" placeholder="매수희망가"
						name="boardPrice" maxlength="30" id="2"></td>
					<td><input type="text" class="form-control" placeholder="최저매수가"
						name="boardEa" maxlength="10" id="3"></td>
					<td><input type="text" class="form-control" placeholder="#검색필터"
						name="boardMemo" maxlength="50"id="4"></td>
					<td><input type="text" class="form-control" placeholder="#포트폴리오 tag"
						name="boardTag" maxlength="50" id="5"></td>
					<td><input type="text" class="form-control"
						placeholder="쇼핑몰 링크" name="boardSellerLink" maxlength="50" id="6"></td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
