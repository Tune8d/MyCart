<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="template/header.jsp" />
 <!-- 본문 시작  -->       
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
							<span>* 이메일을 통해서만 아이디 / 비밀번호 조회가 가능하니, 사용하시는 이메일로 입력해주시길 바랍니다.</span>	
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
 <!-- 본문 끝 -->
<jsp:include page="template/footer.jsp" />
