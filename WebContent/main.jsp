<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>MyCart - 로그인</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" href="css/stylesheet.css">
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
				<a class="navbar-brand" href="main.jsp" class="navbar-center">MyCart</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="board.jsp">쇼핑목록</a></li>
				</ul>
				<%
					if (userID == null) {
				%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="login.jsp">로그인</a></li>
							<li><a href="join.jsp">회원가입</a></li>
						</ul></li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="col-lg-1"></div>
	<!-- 본문 로그인창 시작-->
	<div class="row backgroundimg">
		<div class="container">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<div class="wrapper">
					<div class="jumbotron">
						<form method="post" action="./loginAction.go">
							<img src="images/logo-button_sm.png" id="logo-button" />
							<h2 style="text-align: center;" class="logo">MyCart</h2>
							<h3 style="text-align: center;">지금 담아보세요</h3>
							<div>&nbsp;</div>
							<div class="form-group">
								<!-- name 속성값과 Model 연동 유의  -->
								<input type="text" class="form-control" placeholder="당신의 아이디"
									name="userID" maxlength="20">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="비밀번호"
									name="userPassword" maxlength="20">
							</div>
								<input type="submit" class="btn btn-primary form-control bnt-block"
									value="로그인">
								<input class="btn btn-success btn-block" value="지금 가입하기">
							<div>&nbsp;</div>
							<div id="info" align="center">
								<a href="idFind.jsp" class="id">아이디 찾기</a>/<a
									href="idFind.jsp" class="pw">비밀번호 찾기</a>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-1"></div>
		</div>
	</div>
	<!-- 본문 로그인창 끝-->
	<!-- footer 시작 -->

	<footer class="footer">
		<div class="container">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<p class="text-muted">Copyright 	© 2019 HGD</p>
			</div>
			<div class="col-lg-1"></div>
		</div>
	</footer>

	<%
		} else {
	%>
	<ul class="nav navbar-nav navbar-right">
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown" role="button" aria-haspopup="true"
			aria-expanded="false">회원관리<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="logout.jsp">로그아웃</a></li>
			</ul></li>
	</ul>
			</div>
	</nav>
</div>

	<%
		}
	%>

</body>
</html>
