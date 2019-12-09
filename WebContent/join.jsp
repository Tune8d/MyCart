<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>MyCart - 로그인</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" href="css/stylesheet.css">
</head>
<body>
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
				<a class="navbar-brand" href="index.jsp">MyCart</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="index.jsp">쇼핑목록</a></li>
				</ul>
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
	<!-- 상단 네비게이션 끝-->
	<!-- 본문 가입창 시작-->
	<div class="row backgroundimg">
		<div class="container">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
			<div class="wrapper">
				<div class="jumbotron">
					<form method="post" action="./joinAction.go">
						<img src="images/logo-button_sm.png" id="logo-button" />
						<h2 style="text-align: center;" class="logo">MyCart</h2>
						<h3 style="text-align: center;">회원가입</h3>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="당신의 아이디"
								name="userID" maxlength="20" required="required">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="비밀번호"
								name="userPassword" maxlength="20" required="required">
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="당신의 이름을 알려주세요" name="userName" maxlength="20"
								required="required">
						</div>
						<div class="form-group" style="text-align: center;">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary active"> <input
									type="radio" name="userGender" autoComplete="off" value="남자"
									checked>남자
								</label> <label class="btn btn-danger"> <input type="radio"
									name="userGender" autoComplete="off" value="여자" checked>여자
								</label>
							</div>
						</div>
						<div class="form-group">
							<input type="email" class="form-control" placeholder="이메일"
								name="userEmail" maxlength="20" required="required">
						</div>
						<input type="submit" class="btn btn-primary form-control"
							value="회원가입">
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
				<p class="text-muted">Copyright © 2019 HGD</p>
			</div>
			<div class="col-lg-1"></div>
		</div>
	</footer>
</body>
</html>
