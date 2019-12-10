<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<link rel="stylesheet" href="css/stylesheet_member.css">
<div class="container">
	<div class="row">
		<form method="post" action="./write.tb">
			<table class="table table striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center">게시판
							글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="상품명"
							name="boardTitle" maxlength="50" required></td>
						<td><input type="text" class="form-control" placeholder="가격"
							name="boardPrice" maxlength="30" required></td>
						<td><input type="text" class="form-control" placeholder="수량"
							name="boardEa" maxlength="10" ></td>
						<td><input type="text" class="form-control" placeholder="쇼핑몰"
							name="boardSeller" maxlength="50" ></td>
						<td><input type="text" class="form-control" placeholder="쇼핑몰 링크"
							name="boardSellerLink" maxlength="50" ></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		</form>
	</div>
</div>
