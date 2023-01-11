<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>

<%

/* function goRecipe(){
	
};
 */
%>

<html>
<head>
	<title>Recipe Main</title>
</head>
<body>
<h2>레시피 메인 페이지</h2>
<h3>레시피 검색 결과</h3>

<!-- <input type="submit" value="레시피 이름 검색">
<input type="submit" value="레시피 재료 검색"> -->
<!-- button --->
<!-- <div class="btnSet clear">
    <div>
	    <a href="javascript:;" class="btn" onclick="goRecipe();">레시피 이름 검색</a>
	    <a href="javascript:;" class="btn" onclick="goIngredient();">레시피 재료 검색</a>
	</div>
</div>
 -->
<form>
	<input type="text" name="recipe_name" value="${recipeVO.recipe_name }">	<!-- 검색어 -->
	<!-- <input type="text" name="recipe_ing" value="${recipeVO.recipe_ing }">	<!-- 검색어 -->
	<input type="submit" value="검색">
</form>

<div>
	<input id="recipeBtn" type="button" value="레시피 이름 검색">
	<input id="ingBtn" type="button" value="레시피 재료 검색">
</div>

<table border="1">
	<tr>
		<td>ID</td>
		<td>이름</td>
		<td>난이도</td>
		<td>이미지</td>
	</tr>
	<c:forEach var="vo" items="${list }">	<!-- request에 들어있는 아이템 -->
	<tr>
		<td>${vo.recipe_id }</td>
		<td>${vo.recipe_name }</td>
		<td>${vo.level }</td>
		<td><img src = "${vo.recipe_img }" width="200" height="200" ></td>
	</tr>
	</c:forEach>
</table>

</body>
</html>
