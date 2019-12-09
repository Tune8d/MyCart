<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>MyCart - 로그인</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
function check(){
	var id=loginform.userID.value;
	var pass=loginform.userPassword.value;
	
	if(id.length == 0){
		alert("아이디를 입력하세요.");
		loginform.userID.focus();
		return false;
	}
	if(pass.length == 0){
		alert("비밀번호를 입력하세요.");
		loginform.userPassword.focus();
		return false;
	}
	
	return true;
}
</script>
</head>
<body>
	<!-- 상단 네비게이션 시작 -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">MyCart</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="main.jsp">쇼핑목록</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<!-- 상단 네비게이션 끝-->
	<!-- 본문 로그인창 시작-->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="./loginAction.go" name="loginform" onsubmit="return check()">
					<h2 style="text-align: center;">MyCart</h2>
					<h3 style="text-align: center;">지금 담아보세요</h3>
					<div class="form-group">
						<!-- name 속성값과 Model 연동 유의  -->
						<input type="text" class="form-control" placeholder="당신의 아이디"
							name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="로그인">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<!-- 본문 로그인창 끝-->
</body>
</html>
