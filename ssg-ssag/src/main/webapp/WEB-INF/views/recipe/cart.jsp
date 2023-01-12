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
<script>
 function refg() {
	 location.href="http://localhost:8081/ssgssag/refg.ssg";	 
	 
 }
 </script>
<h2>장바구니</h2>
<table border="1">
	<tr>
		<td> 재고(?)</td>
		<td> update_date</td>
	</tr>
	<c:forEach var="vo" items="${list }">
	<tr>
		<td>${vo.ing_name}</td>
		<td>${vo.update_date}</td>
	</tr>
	</c:forEach>
</table>
<input type="button" value="냉장고로 이동" onclick="refg();">
</body>
</html>