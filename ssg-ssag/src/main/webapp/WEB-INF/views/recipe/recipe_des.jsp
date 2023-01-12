<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>recipe description</h2>
<script>
 function cart(user_no) {
	 location.href="cart.ssg?user_id="+user_no;	 
	 
 }
 </script>
<table border="1">
	<tr>
		<td> 재료 명</td>
	</tr>
	<c:forEach var="vo" items="${list_ing }">
	<tr>
		<td>${vo}</td>
	</tr>
	</c:forEach>
</table>

<input type="button" value="장바구니로 이동" onclick="cart(1);">

<table border="1">
	<tr>
		<td> 조리 단계</td>
	</tr>
	<c:forEach var="vo" items="${list_step }">
	<tr>
		<td>${vo}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>