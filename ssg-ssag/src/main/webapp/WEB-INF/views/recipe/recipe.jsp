<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Recipe Main</title>
</head>
<body>
<h2>레시피 메인 페이지</h2>
</body>

<h2>${recipeVO.recipe_id }</h2>

<form>
	<select name="recipe_id">
		<option value="">전체</option>
	</select>
	<input type="text" name="recipe_id" value="${recipeVO.recipe_id }">	<!-- 검색어 -->
	<input type="submit" value="검색">
</form>

<table border="1">
	<tr>
		<td>ID</td>
		<td>이름</td>
		<td>난이도</td>
	</tr>
	<c:forEach var="vo" items="${list }">	<!-- request에 들어있는 아이템 -->
	<tr>
		<td>${vo.recipe_id }</td>
		<td>${vo.recipe_name }</td>
		<td>${vo.level }</td>
	</tr>
	</c:forEach>
</table>

</html>
