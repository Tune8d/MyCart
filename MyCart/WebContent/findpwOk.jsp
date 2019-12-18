<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String id = (String) request.getAttribute("userID");
	String pw = (String) request.getAttribute("userPassword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 확인</title>
<script>
function windowclose(){
	self.close();
}
</script>
</head>
<body>

	<table width="440px">
		<thead>
			검색된 비밀번호와 입력하신 아이디 입니다
			<br>
			<br>
			<tr>
				<td align="left">아이디 : <%= id %>
				</td>
			</tr>
			<tr>
				<td align="left">비밀번호: <%= pw %>
				</td>
			</tr>
	</table>

	<table width="450px">
		<tr>
			<td align="center">
				<hr />
				<br>
			<a href="#" onclick="windowclose();">닫기</a>
			</td>
		</tr>
	</table>

</body>
</html>