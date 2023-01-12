<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Recipe Ingredient</title>
</head>
<body>
<h2>레시피 재료 조회</h2>

<script>
function page(user_no, pg, id, name) {
	 if (pg == 1){			// 장바구니로 이동
	 	location.href="cart.ssg?user_id="+user_no + "&recipe_id=" + id + "&recipe_name=" + name;
	 } else if (pg == 2){	// 이전 페이지로 이동
	 	location.href="recipe_des.ssg?user_id="+user_no + "&recipe_id=" + id + "&recipe_name=" + name;
	 }
	 
}
</script>
 
<h2>${recipeVO.recipe_name}의 재료 목록</h2>

<input type="button" value="레시피로 돌아가기" onclick="page(1, 2, ${recipeVO.recipe_id}, '${recipeVO.recipe_name}');">

<table border="1">
	<tr>
		<td>레시피 재료</td>
	</tr>
	<c:forEach var="vo" items="${list_detail }">
	<tr>
		<td>${vo.ing_name}</td>
	</tr>
	</c:forEach>
</table>

<input type="button" value="장바구니로 ssag" onclick="page(1, 1, ${recipeVO.recipe_id}, '${recipeVO.recipe_name}');">

</body>
</html>