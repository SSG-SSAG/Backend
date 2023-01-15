<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>

function goPage(pg, id, name) {
	if (pg == 1) {
		location.href = "../";		
	}
}

</script>
 
<html>
<head>
	<title>My Page</title>
</head>
<body>
<h2>${currentUser.name }님 안녕하세요!</h2>

<input type="button" value="홈으로 돌아가기" onclick="goPage(1)">

<table border="1">
	<h3>${currentUser.name }님이 관심 있는 태그예요</h3>	
	<tr>
		<td></td>
		<td>카테고리</td>
		<td>#관심태그</td>
	</tr>
	<c:forEach var="vo" items="${list_tags }" varStatus="status">
	<tr>
		<td>${status.count}</td>
		<td>${vo.category_name }</td>
		<td>${vo.tag_name }</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>
