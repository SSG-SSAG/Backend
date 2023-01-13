<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Recipe Description</title>
</head>
<body>
<h2>레시피 과정 조회</h2>
<script>

function goPage(user_no, pg, id, name) {
	if (pg == 1) {			// 장바구니로 이동
		location.href = "cart.ssg?user_id=" + user_no + "&recipe_id=" + id + "&recipe_name=" + name;		 
	} else if (pg == 2) {	// 다음 페이지로 이동
		location.href = "recipe_ing.ssg?user_id=" + user_no + "&recipe_id=" + id + "&recipe_name=" + name;
	} else if (pg == 3) {	// 이전 페이지로 이동
		location.href = "recipe_search.ssg";
	}
}
 </script>

<h2>${recipeVO.recipe_name }의 레시피</h2>

<input type="button" value="재료 상세 보기" onclick="goPage(1, 2, ${recipeVO.recipe_id}, '${recipeVO.recipe_name}');">
<input type="button" value="검색으로 돌아가기" onclick="goPage(1, 3);">

<table border="1">
	<tr>
		<td></td>
		<td>조리 단계</td>
		<td>이미지</td>
	</tr>
	<c:forEach var="vo" items="${list_step }" varStatus="status">
	<tr>
		<td>${status.count}</td>
		<td>${vo.description}</td>
		<td><img src = "${vo.dsc_img }" width="200" height="200" ></td>
	</tr>
	</c:forEach>
</table>

</body>
</html>