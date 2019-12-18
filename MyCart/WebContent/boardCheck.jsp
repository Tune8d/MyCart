
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
	<a href="main.jsp"><img src="images/logo-button_tb.png"
		class="img-responsive" id="logo-button" /></a>
	<form method="post" action="./delete.tb">
		<div class="panel panel-default" class="col-md-12">
			<div class="panel-body" style="text-align: center;">
				<h5>${userID}님의 장바구니에 등록된 물품가짓수: (param 설계 필요)
				<%--  ${boardlist}종류 = BUY ${}종 + SELL ${ }종 </h5>
				<h5>기대수익: ${ } 원</h5>
				<h5>평균매수단가: 약 ${ } 원</h5>
				<h5>평균매도단가: 약 ${ } 원</h5> --%>
			</div>
		</div>
		<div></div>
		<div class='menu_line' style='clear: both;'></div>
		<table class="table table striped action"
			style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr colspan="2" style="background-color: #333333; color: #eeeeee">
					<td>No.</td>
					<!-- 추가하기 뺐으니까 텍스트 에리어를 -->
					<td>구분</td>
					<td>상품명</td>
					<td>희망가격</td>
					<td>실제가격</td>
					<td>#검색필터</td>
					<td>#포트폴리오</td>
					<td>Link</td>
				</tr>
				<%
						for(int i=0;i<boardList.size();i++){
							BoardDTO boardDTO =(BoardDTO)boardList.get(i);
					%>
				<%-- placeholder 도 죄다 null --%>
				<tr colspan="2">
					<td><%=boardDTO.getBoardNumber() %></td>
					<td><%=boardDTO.getBoardType()%></td>
					<td><a href="./view.tb?boardID=<%= boardDTO.getBoardID()%>"><%=boardDTO.getBoardTitle()%></a></td>
					<td><%=boardDTO.getBoardPrice()%></td>
					<td><%=boardDTO.getBoardEa()%></td>
					<td><%=boardDTO.getBoardMemo()%></td>
					<td><%=boardDTO.getBoardTag()%></td>
					<td><a id="hl" href="<%=boardDTO.getBoardSellerLink()%>">Link</a></td>
				</tr>
				<tr>
					<td><input id="hid" type="hidden"
						value="<%=boardDTO.getBoardID()%>"></td>
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
	<form name='frm' method='post' action='./list.jsp'>
		<aside style='float: right;'>
			<select name='col'>
				<!-- 검색 컬럼 -->
				<option value='none'>전체 목록</option>
				<option value='rname'>상품명</option>
				<option value='tag'>tag</option>
			</select> <input type='text' name='word' value=''
				placeholder="특수문자는 사용할수 없습니다.">
			<button type='submit'>검색</button>
			<button type='button'
				onclick="window.open('./create_form.jsp', '', 'width=700, height=630'); return false;">등록</button>
		</aside>
	</form>
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
