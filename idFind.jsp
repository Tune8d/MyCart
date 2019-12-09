<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<script type="text/javascript">
function formSubmit(){
	var forms = document.getElementById("findform");
	
	if ((forms.MEMBER_ID.value=="") ||
		(forms.MEMBER_ID.value.length<=1)){
		alert("이름을 정확히 입력해 주십시오.");
		forms.MEMBER_NAME.focus();
        return false;
        
	}else if(email1.length == 0 || email2.length ==0){
		alert("이메일을 제대로 입력하세요.");
		joinform.MEMBER_EMAIL1.focus();
		return false;
	}
	return true;
}

</script>
<body>
<table width="500px" height="20px" align="center">
	<tr>
		<td><b>아이디 찾기</b></td>
	</tr>
</table>
	
<form action="./idFindAction.go" method="post" name="findId" onclick="return fromSubmit();">
	<table width="500px" border-collapse="collapse" >
		<thead>
			<font size="2">
			아이디와 이메일을 입력하세요
			<br><br>
			</font>
		</thead>
		<tr>
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td height="29" bgcolor="#F3F3F3">
				<font size="2">이 름</font>
			</td>
			<td>
				&nbsp;
				<input type="text" name="userName" maxlength="12" size="14">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td height="29" bgcolor="#F3F3F3">
				<font size="2">이메일</font>
			</td>
			<td>
				&nbsp;
				<input type="text" name="userEmail" maxlength="20" size="14">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" style="padding: 10px 0 10px 0" align="center">
				<input type="submit" value="찾기">
			</td>
		</tr>
	</table>


</form>
</body>
</html>