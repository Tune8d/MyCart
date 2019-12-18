<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="css/one-page-wonder.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
<style>
#header{
	background-image: url("./images/back2.png");
	width: 1700px;
	height: 400px;
	display:block;
	margin: 0 auto;
}
	
#s1 {
	margin-left: 230px;
	margin-right: 50px; 
	float: left;
	margin-bottom: 50px;
}
#s2 {
	margin-left: 250px;
	margin-right: 100px; 
	margin-bottom: 50px;
	float: left;
}
#s3{
	margin-left: 230px;
	margin-right: 50px; 
	float: left;
	margin-bottom: 50px;
}

#i1 {
	margin-left:160px;
	width: 280px;
	height: 360px;
}

#i2 {
	width: 390px;
	height: 230px;
	margin-left: 230px;
}

#i3 {
	width: 330px;
	height: 70px;
	margin-left: 230px;
	margin-right: 100px;
}

#help {
	font-family: 'Sonar';
	font-weight: 900;
}

#use {
	font-family: 'Century Gothic';
}
#home {
	width:130px;
    background-color: #b298e6;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    border-radius: 10px;
}

	
</style>

<jsp:include page="header.jsp" />
  <header class="masthead text-center text-white" id="header">    
  	<div class="masthead-content">
      <div>
        <h1 class="masthead-heading mb-0" align="center" id="help" >Help</h1>
        <h2 class="masthead-subheading mb-0" align="center" id="use">쉽고 빠른 MyCart 사용법</h2>
			<div>
				<form action="main.jsp">
					<input type="submit" value="지금 시작하기" id="home" />
				</form>
			</div>
		</div>
    </div>
  </header>
  
  <br>
  <hr/>
  <br>
  
  <div align="center">
  <img id="i1" src="images/1.PNG"> 
  <img id="i2" src="images/2-1.PNG"> 
  <img id="i3" src="images/4.PNG"> 
  </div>
  
  <br><br>
  
  <section id="s1" >
    <div>
      <div >
        <div >
          <div>
          </div>
        </div>
        <div >
          <div >
            <h2>1. 회원가입을 해주세요</h2> <br>
            <p align="center"> 메인페이지에서 <br>
            간편하고 빠르게 회원가입을 진행할 수 있습니다</p>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section id="s2">
    <div>
      <div >
        <div>
          <div>
          </div>
        </div>
        <div>
          <div>
            <h2 align="center">2. 추가하기</h2> <br>
            <p align="center">초록색 추가하기 버튼을 클릭해 <br>
            빠르게 내 카트에 담으세요</p>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section id="s3">
    <div>
      <div >
        <div>
          <div>
          </div>
        </div>
        <div>
          <div>
            <h2 align="center">3. 확인, 수정</h2>
            <p align="center"> 추가 한 후, 확인하기 버튼을 눌러 <br>
            내 리스트를 한눈에 확인하세요 <br>
            내 리스트 삭제, 수정도 원클릭으로 가능합니다</p>
          </div>
        </div>
      </div>
    </div>
  </section>
 
  <br><br>
 <!-- 본문 끝 -->
<jsp:include page="footer.jsp"/>

