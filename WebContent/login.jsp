<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />
<link rel="stylesheet" href="css/stylesheet_member.css">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://code.jquery.com/jquery-latest.js"></script> 
 
<style>
   /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 20%; /* Could be more or less, depending on screen size */ 
            bottom: 20%;
            margin-bottom: -50px;                         
        }
        
      	/* #img {
        	background-image: url("./images/back2.png");
			width: 1920px;
			height: 865px;
		
			/* display: block;
			margin: 0 auto;
        }  */
 		
</style>
 <!-- 본문 로그인창 시작-->
	<div class="row backgroundimg" id="img"> 
	<!-- <img src="./images/back2.png"> -->

		<div class="container" id="img">
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
								<input class="btn btn-success btn-block" value="지금 가입하기" id="button">
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
				<!-- The Modal -->
    <div id="myModal" class="modal">
    
      <!-- Modal content -->
      <div class="modal-content" id="modal-content">
           <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">회원가입</span></b></span></p>
               <p style="text-align: center; line-height: 1.5;"><br /></p>
                	<form method="post" action="./joinAction.go">
						<img src="images/logo-button_sm.png" id="logo-button" align="middle"/>
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
						<input type="submit" class="btn btn-primary form-control" value="회원가입">
					</form>
            	<input type="button" value="닫기" class="btn btn-success form-control" onClick="close_pop();">
             
            </div>
      </div>
    </div>
        <!--End Modal-->
        
		</div>
	</div>
	
	<script type="text/javascript">
      
        jQuery(document).ready(function() {
              /* $('#myModal').onclick(); */
        });
        //팝업 Close 기능
        function close_pop(flag) {
             $('#myModal').fadeOut();
        };
        
     $(function(){
        	$('#button').click(function(){
        		$('#myModal').fadeIn();
        	});
        	
        	$('#img').css('background-image: url("./images/back2.png"), width: 1920px, height: 865px');
        	
       });
      </script>
	
 <!-- 본문 끝 -->
<jsp:include page="footer.jsp" />
