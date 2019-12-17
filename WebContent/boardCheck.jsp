<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.db.BoardDTO"%>
<link rel="stylesheet" href="css/stylesheet_board.css">
<%
List<BoardDTO> boardList=(List<BoardDTO>)request.getAttribute("boardlist");
	// request 객체에 set 한 값을 이제야 응답되는 페이지에서 비로소 요청하게된다...!
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
%>
<jsp:include page="header.jsp" />
<%-- header 의 session 별도 처리 --%>
<title>작성글 목록</title>
<!-- 본문시작 -->
<script type="text/javascript">
 
function listenForDoubleClickLink(element) {
	document.getElementById("hl").innerHTML	= document.getElementById('hl').getAttribute('href');
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
<%
if(listcount > 0){	
%>
	<form method="post" action="./delete.tb">
		<a href="main.jsp"><img src="images/logo-button_tb.png"
			class="img-responsive" id="logo-button" /></a>
		<div class="panel panel-default" class="col-md-12">
			<div class="panel-body" style="text-align: center;">
				<h5>${userID}님의
					장바구니에 등록된 물품가짓수 : ${listcount}개
				</h5>
				<h5>총액: ${boardListSum } 원</h5>
				<h5>평균액: ${boardListAvg } 원</h5>
				<h5>총갯수: ${boardListItems } 개</h5>
			</div>
		</div>
		<div></div>
		<table class="table table striped action"
			style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr colspan="2" style="background-color: #333333; color: #eeeeee">
					<td>No.</td>
					<!-- 추가하기 뺐으니까 텍스트 에리어를 -->
					<td>상품명</td>
					<td>가격</td>
					<td>개수</td>
					<td>Link</td>
					<td>메모</td>
					<td>태그</td>
				</tr>
				<%
					for(int i=0;i<boardList.size();i++){
						BoardDTO boardDTO =(BoardDTO)boardList.get(i);
				%>
				<%-- placeholder 도 죄다 null --%>
				<tr colspan="2">
					<td><%=boardDTO.getBoardNumber() %></td>
					<td><a href="./view.tb?boardID=<%= boardDTO.getBoardID()%>"><%=boardDTO.getBoardTitle()%></a></td>
					<td><%=boardDTO.getBoardPrice()%></td>
					<td><%=boardDTO.getBoardEa()%></td>
					<td><a id="hl" href="<%=boardDTO.getBoardSellerLink()%>">Link</a></td>
					<td><%=boardDTO.getBoardMemo()%></td>
					<td><%=boardDTO.getBoardTag()%></td>
				</tr>
				<tr>
					<td><input id="hid" type="hidden" value="<%=boardDTO.getBoardID()%>"></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</form>
	<ul class="pagination">
		<%if(nowpage<=1){ %>
		<li><a><span class="glyphicon glyphicon-chevron-left"></span></a></li>
		<%}else{ %>
		<li><a href="./check.tb?page=<%=nowpage-1 %>"><span
				class="glyphicon glyphicon-chevron-left"></span></a></li>
		<%} %>

		<%for(int a=startpage;a<=endpage;a++){
			if(a==nowpage){%>
		<li><a><%=a %></a></li>
		<%}else{ %>
		<li><a href="./check.tb?page=<%=a %>"><%=a %></a></li>
		<%} %>
		<%} %>
		<%if(nowpage>=maxpage){ %>
		<li><a><span class="glyphicon glyphicon-chevron-right"></span></a></li>
		<%}else{ %>
		<li><a href="./check.tb?page=<%=nowpage+1%>"><span
				class="glyphicon glyphicon-chevron-right"></span></a></li>
		<%} %>
	</ul>

</div>
<%
    } else {
	%>
<a href="main.jsp"><img src="images/logo-button_tb_goback.png"
class="img-responsive" id="logo-button" /></a>	
		<div class="panel panel-default" class="col-md-12">
			<div class="panel-body" style="text-align: center;">
				<h5>등록된 글이 없습니다. 로고를 눌러 다시 물품을 담아주세요.</h5>
			</div>
		</div>

<%
	}
	%>
