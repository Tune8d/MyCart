<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />
<link rel="stylesheet" href="css/stylesheet_member.css">
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
 <!-- 본문 끝 -->
<jsp:include page="footer.jsp" />
