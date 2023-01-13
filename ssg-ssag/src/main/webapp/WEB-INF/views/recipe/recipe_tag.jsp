<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>

<script>

function goPage(pg, id, name) {
	if (pg == 1) {
		location.href = "recipe_des.ssg?recipe_id=" + id + "&recipe_name=" + name;		
	} else if (pg == 2) {	// 다음 페이지로 이동
		location.href = "recipe_des.ssg?recipe_id=" + id + "&recipe_name=" + name;
	} else if (pg == 3) {	// 이전 페이지로 이동
		location.href = "recipe_cat.ssg?cat=" + id;
	}
}

function srch_sort() {
	rForm.submit();	// form 자체를 통째로 전송
}

</script>
 
<html>
<head>
	<title>Recipe Tag</title>
</head>
<body>
<h2>레시피 태그 별 조회 페이지</h2>
<h1>#${recipeVO.tag_name} 레시피 모음 </h1>

<form name="rForm" action="recipe_tag.ssg" method="get">
	<!-- 정렬 기준 -->
	<select name="sort" onchange="srch_sort()">
		<option value="name" <c:if test="${recipeVO.sort == 'name' }">selected</c:if>>가나다순</option>
		<option value="like" <c:if test="${recipeVO.sort == 'like' }">selected</c:if>>인기순</option>
		<option value="level" <c:if test="${recipeVO.sort == 'level' }">selected</c:if>>난이도순</option>
	</select>
	<input type="hidden" name="tag_id" value="${recipeVO.tag_id }">
	<input type="hidden" name="tag_name" value="${recipeVO.tag_name }">
</form>

<input type="button" value="다시 선택" onclick="goPage(3, ${param.cat})">

<table border="1">
	<tr>
		<td></td>
		<td>ID</td>
		<td>이름</td>
		<td>난이도</td>
		<td>좋아요</td>
		<td colspan="2">이미지</td>
	</tr>
	<c:forEach var="vo" items="${list_tag }" varStatus="status">	<!-- request에 들어있는 아이템 -->
	<tr>
		<td>${status.count}</td>
		<td>${vo.recipe_id }</td>
		<td>${vo.recipe_name }</td>
		<td>${vo.level }</td>
		<td>${vo.cnt }</td>
		<td><img src = "${vo.recipe_img }" width="200" height="200" ></td>
		<td><input type="button" value="상세보기" onclick="goPage(2, ${vo.recipe_id}, '${vo.recipe_name}')"></td>
	</tr>
	</c:forEach>
</table>

</body>
</html>
