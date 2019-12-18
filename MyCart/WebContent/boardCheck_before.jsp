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
	function listenForDoubleClick(element) {
		element.contentEditable = true;
/* 		setTimeout(function() {
			if (document.activeElement !== element) {
				element.contentEditable = false;
			}
		}, 300); */
	}

	function listenForDoubleClickLink(element) {
		var url = document.getElementById('hl').getAttribute('href');
		document.getElementById("hl").innerHTML = url;
		element.contentEditable = true;
/* 		$('form').click(function(event){
			document.getElementById('hl').innerHTML  = 'Link';
		    document.getElementById('hl').href=url;
		});
 */		setTimeout(function() {
			if (document.activeElement !== element) {
/* 				document.getElementById('hl').innerHTML  = 'Link';
			    document.getElementById('hl').href=url;  
	//원래는 편집끝나면 다시 돌아가게 하려고 했는데.. 전체 저장시 다시 Link로 표시되게 하는게 나을듯		    
			    
			    
			    */
				element.contentEditable = false;
			}	
		}, 300);	
	}
	function copyContent () {
	    document.getElementById("hiddenTextarea").value =  
	        document.getElementById("myContentEditable").innerHTML;
	    return true;
	}	
	
</script>
<!-- 글쓰기 기능 -->
<div class="wrapper">
	<div class="container" id="main">
		<form method="post" action="./write.tb">
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
				<a><input type="submit" class="btn btn-warning menu_button"
					value="수정하기"></a> <a><input
					class="btn btn-primary menu_button" value="확인하기"
					onClick="javascript:window.location='./check.tb'"></a>
				<!-- 목록 원페이지화 같은거라면 추가 -->
			</div>
			<div>&nbsp;</div>
			<table class="table table striped action"
				style="text-align: center; border: 1px solid #dddddd">
				<tbody>
					<tr colspan="2">
						<td>No.</td>
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
						<td><a href="#" data-toggle="tooltip" title="#으로 태그 추가 가능"><input
								type="text" class="form-control" placeholder="태그"
								name="boardTag" maxlength="50"></a></td>
					</tr>
					<%
					for(int i=0;i<boardList.size();i++){
						BoardDTO boardDTO =(BoardDTO)boardList.get(i);
				%>
					<tr colspan="2'">
						<td onclick="listenForDoubleClick(this);"
							onblur="this.contentEditable=false;"><%=boardDTO.getBoardID()%></td>
						<td onclick="listenForDoubleClick(this);"
							onblur="this.contentEditable=false;"><%=boardDTO.getBoardTitle()%></td>
						<td onclick="listenForDoubleClick(this);"
							onblur="this.contentEditable=false;"><%=boardDTO.getBoardPrice()%></td>
						<td onclick="listenForDoubleClick(this);"
							onblur="this.contentEditable=false;"><%=boardDTO.getBoardEa()%></td>
						<td onclick="listenForDoubleClickLink(this);"
							onblur="this.contentEditable=false;"><a id="hl"
							href="http://<%=boardDTO.getBoardSellerLink()%>">Link</a></td>
						<td onclick="listenForDoubleClick(this);"
							onblur="this.contentEditable=false;"><%=boardDTO.getBoardMemo()%></td>
						<td onclick="listenForDoubleClick(this);"
							onblur="this.contentEditable=false;"><%=boardDTO.getBoardTag()%></td>
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
			<li><a href="./check.tb?page=<%=nowpage+1 %>"><span
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