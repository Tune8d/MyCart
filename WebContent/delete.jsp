<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>MVC 게시판</title>
</head>
<body>
<form name="deleteForm" action="./MyTableDeleteAction.tb" method="post">
<table border=1>
<tr>
	<td>
		<font size=2>게시글 번호 입력: </font>
	</td>
	<td>
		<input name="boardID" type="text">
	</td>
</tr>
<tr>
	<td colspan=2 align=center>
		<input type="submit" value="삭제">&nbsp;&nbsp;
	<!-- 	<input type="submit" value="삭제" onclick="close() ">돌아가기</a> -->
	</td>
</tr>
</table>
</form>
</body>
</html>
