<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>

<!--
<script>
var flag = "rcp"
</script>
 -->
 <script>
 function rcp_des(recipe_id) {
	 location.href="recipe_des.ssg?recipe_id="+recipe_id;
 }
 
function srch_sort(sort) {
	 location.href="recipe_search.ssg?sort="+sort;
 }
 
</script>

<html>
<head>
	<title>Recipe Main</title>
</head>
<body>
<h2>레시피 메인 페이지</h2>
<h3>레시피 검색 결과</h3>
<form action="recipe_search.ssg">
<select name="sort" onchange="srch_sort(this.value)">
	<option value="name" <c:if test="${recipeVO.sort == 'name' }">selected</c:if>>가나다순</option>
	<option value="like" <c:if test="${recipeVO.sort == 'like' }">selected</c:if>>인기순</option>
	<option value="level" <c:if test="${recipeVO.sort == 'level' }">selected</c:if>>난이도순</option>
</select>
</form>
<form name="rForm" action="recipe_search.ssg" method="get">
	<select name="type">
		<option value="all" <c:if test="${recipeVO.type == 'all' }">selected</c:if>>전체</option>
		<option value="rcp" <c:if test="${recipeVO.type == 'rcp' }">selected</c:if>>레시피</option>
		<option value="ing" <c:if test="${recipeVO.type == 'ing' }">selected</c:if>>재료</option>
	</select>
	<%-- <select name="sort" onchange="sort(${vo.sort})">
		<option value="name" <c:if test="${recipeVO.sort == 'name' }">selected</c:if>>가나다순</option>
		<option value="like" <c:if test="${recipeVO.sort == 'like' }">selected</c:if>>인기순</option>
		<option value="level" <c:if test="${recipeVO.sort == 'level' }">selected</c:if>>난이도순</option>
	</select> --%>
	<input type="text" name="rname" value="${recipeVO.rname }">	<!-- 검색어 -->
	<input type="submit" value="검색">
</form>

<table border="1">
	<tr>
		<td>ID</td>
		<td>이름</td>
		<td>난이도</td>
		<td>찜</td>
		<td colspan="2">이미지</td>
	</tr>
	<c:forEach var="vo" items="${list }">	<!-- request에 들어있는 아이템 -->
	<tr>
		<td>${vo.recipe_id }</td>
		<td>${vo.recipe_name }</td>
		<td>${vo.level }</td>
		<td>${vo.cnt }</td>
		<td><img src = "${vo.recipe_img }" width="200" height="200" ></td>
		<td><input type="button" value="상세보기" onclick="rcp_des(${vo.recipe_id})"></td>
	</tr>
	</c:forEach>
</table>

</body>
</html>
