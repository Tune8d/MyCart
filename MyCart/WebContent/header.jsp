<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>MyCart</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" href="css/stylesheet_header.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<!-- 상단 네비게이션 시작 -->
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
		<nav class="navbar navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<%
					if (userID == null) {
				%>
				<a class="nav navbar-brand" href="main.jsp"
					class="navbar-center menu">MyCart</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="help.jsp">도움말<span
							class="glyphicon glyphicon-question-sign"></span></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><span>접속하기</span><span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="login.jsp">로그인</a></li>
						</ul></li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="col-lg-1"></div>
	<%
		} else {
	%>
	<!-- 	<ul class="nav navbar-nav">
		<li><a href="boardWrite.jsp" class="menu">MyTable</a></li>
	</ul>
 -->
	<a class="nav navbar-brand" href="main.jsp" class="navbar-center menu">MyCart</a>
</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

		<ul class="nav navbar-nav navbar-right">
			<li><a href="help.jsp">도움말<span
					class="glyphicon glyphicon-question-sign"></span></a></li>
			<li><a class="nav navbar-brand" href="logout.jsp"
				class="navbar-center menu"><span class="glyphicon glyphicon-off"></span></a></li>
		</ul>
	</div>
	</nav>
	</div>
	<div class="col-lg-1"></div>

	<%
		}
	%>

</body>
</html>
