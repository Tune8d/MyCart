<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check(){
		var number = addlist.number.value;
		var category = addlist.category.value;
		var goodsname = addlist.goodsname.value;
		var price = addlist.price.value;
		var quantity = addlist.quantity.value;
		var store = addlist.store.value;
		var note = addlist.note.value;
		
		if(number.length == 0){
			alert("번호를 입력하세요.");
			addlist.number.focus();
			return false;
		}if(category.length == 0){
			alert("상품 카테고리를 입력하세요.");
			addlist.category.focus();
			return false;
		}if(goodsname.length == 0){
			alert("상품명을 입력하세요.");
			addlist.goodsname.focus();
			return false;
		}if(price.length == 0){
			alert("가격을 입력하세요.");
			addlist.price.focus();
			return false;
		}if(quantity.length == 0){
			alert("수량을 입력하세요.");
			addlist.quantity.focus();
			return false;
		}if(store.length == 0){
			alert("쇼핑몰명을 입력하세요.");
			addlist.store.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<style>
	table {border-collapse: collapse;}
</style>
<body>
	<% 
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>
	
	<% if(userID != null){ %>
	<div style="font-size: 26pt;" align="center"><%= userID %>'s List</div>
	<form action="" method="post" name="addlist" onsubmit="return check()">
		<table border="1" align="center" width="500" cellpadding="10">
			<tr>
				<th><font size=4>번호</font></th>
				<td><input type="text" name="number" size="5"></td>
			</tr>
			<tr>
				<th><font size=4>상품 카테고리</font></th>
				<td><input type="text" name="category" size="20"></td>
			</tr>
			<tr>
				<th><font size=4>상품명</font></th>
				<td><input type="text" name="goodsname" size="20"></td>
			</tr>
			<tr>
				<th><font size=4>가격</font></th>
				<td><input type="text" name="price" size="20"></td>
			</tr>
			<tr>
				<th><font size=4>수량</font></th>
				<td><input type="text" name="quantity" size="5"></td>
			</tr>
			<tr>
				<th><font size=4>쇼핑몰</font></th>
				<td><input type="text" name="store" size="20"></td>
			</tr>
			<tr>
				<th ><font size=4>비고</font></th>
				<td >
					<textarea  name="note" rows="5" cols="20"></textarea>
				</td>
			</tr>
			<tr align="center"><td colspan="2"><input type="submit" value="리스트에 추가하기!"></td></tr>
		</table>
	</form>
	<% }else{ %>
		<script type="text/javascript">
			
			location.href = "main.jsp";	
		</script>
	<% } %>
</body>
</html>