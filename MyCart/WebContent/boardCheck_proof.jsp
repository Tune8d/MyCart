<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="board.db.BoardDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.PrintWriter"%>
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
<script>
// 그러면 getElementsByName 으로 해서 innerHTML 로 받자.
	function saveHidden(){
	    for(var i = 0; i < document.getElementsByName("boardID").length; i++){
/* 			document.getElementsByName("boardTitleHidden")[i].innerHTML = document.getElementsByName("boardTitle")[i].value;
			document.getElementsByName("boardPriceHidden")[i].innerHTML = document.getElementsByName("boardPrice")[i].value;
			document.getElementsByName("boardEaHidden")[i].innerHTML = document.getElementsByName("boardEa")[i].value;
			document.getElementsByName("boardSellerLinkHidden")[i].innerHTML = document.getElementsByName("boardSellerLink").value;
			document.getElementsByName("boardMemoHidden")[i].innerHTML = document.getElementsByName("boardMemo")[i].value;
			document.getElementsByName("boardTagHidden")[i].innerHTML = document.getElementsByName("boardTag")[i].value;
 */	    }
    	alert('saved!')
    	alert(document.getElementsByName("boardIDHidden")[0].value);
    	alert(document.getElementsByName("boardTitleHidden")[0].value);
    	alert(document.getElementsByName("boardPriceHidden")[0].value);
    	alert(document.getElementsByName("boardEaHidden")[0].value);



	}
</script>
<!-- 글쓰기 기능 -->
<div class="container" id="main">
	<form method="post" action="./update.tb">
		<img src="images/logo-button_tb.png" class="img-responsive"
			id="logo-button" />
		<div class="panel panel-default" class="col-md-12">
			<div class="panel-body" style="text-align: center;">
				<h5>${userID}님의
					장바구니에 등록된 물품수 (매우 정확함)
					<%
					if(listcount > 0){	
				%>
					: ${listcount}개
				</h5>
				<h5>총액: 00000원(이거 EL로 끌어와야함)</h5>
			</div>
		</div>
		<div>&nbsp;</div>
		<div class="btn-group btn-group-justified text-center">
			<input id="button1" class="btn btn-success menu_button" value="저장하기"
				onclick="saveHidden()"> <input id="button2" type="submit"
				class="btn btn-warning menu_button" value="수정하기">
		</div>
		<div>&nbsp;</div>
		<table class="table table striped action"
			style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr colspan="2">
					<td>No.</td>
					<!-- 추가하기 뺐으니까 텍스트 에리어를 -->
					<td>상품명</td>
					<td>가격</td>
					<td>개수</td>
					<td>쇼핑몰 링크</td>
					<td>메모</td>
					<td>태그</td>
				</tr>
				<%
					for(int i=0;i<boardList.size();i++){
						BoardDTO boardDTO =(BoardDTO)boardList.get(i);
				%>
				<%-- placeholder 도 죄다 null --%>
				<tr colspan="2">
					<td><input name="boardID" type="text"
						value="<%=boardDTO.getBoardID()%>" readonly></td>
					<td><input name="boardTitle" type="text"
						value="<%=boardDTO.getBoardTitle()%>"></td>
					<td><input name="boardPrice" type="text"
						value="<%=boardDTO.getBoardPrice()%>"></td>
					<td><input name="boardEa" type="text"
						value="<%=boardDTO.getBoardEa()%>"></td>
					<td><input name="boardSellerLink" type="text"
						value="<%=boardDTO.getBoardSellerLink()%>"></td>
					<td><input name="boardMemo" type="text"
						value="<%=boardDTO.getBoardMemo()%>"></td>
					<td><input name="boardTag" type="text"
						value="<%=boardDTO.getBoardTag()%>"></td>
					<%-- hidden type 으로 반환...안되므로 출력 DOM 을 js 로 제어해서 hidden 에 삽입 --%>
					<td><input name="boardIDHidden" type="hidden"
						value="<%=boardDTO.getBoardID()%>" readonly></td>
					<td><input name="boardTitleHidden" type="hidden"
						value="<%=boardDTO.getBoardTitle()%>"></td>
					<td><input name="boardPriceHidden" type="hidden"
						value="<%=boardDTO.getBoardPrice()%>"></td>
					<td><input name="boardEaHidden" type="hidden"
						value="<%=boardDTO.getBoardEa()%>"></td>
					<td><input name="boardSellerLinkHidden" type="hidden"
						value="<%=boardDTO.getBoardSellerLink()%>"></td>
					<td><input name="boardMemoHidden" type="hidden"
						value="<%=boardDTO.getBoardMemo()%>"></td>
					<td><input name="boardTagHidden" type="hidden"
						value="<%=boardDTO.getBoardTag()%>"></td>
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
<font size=2>등록된 글이 없습니다.</font>
<%
	}
	%>
</div>
</div>
</div>
<!-- 본문 끝 -->
<jsp:include page="footer.jsp" />