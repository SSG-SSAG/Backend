<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>

<!--
<script>
var flag = "rcp"
function goRecipe(){
	alert('레시피 이름 검색으로 변경');
	console.log("레시피 이름 검색");
	
	document.srchForm.action="recipe.ssg";
	document.srchForm.method="get";
	document.srchForm.submit();
	
}

function goIngredient(){	
	alert('레시피 재료 검색으로 변경');
	console.log("레시피 재료 검색");
}
</script>
 -->
 <script>
 function rcp_des(recipe_id) {
	 location.href="recipe_des.ssg?recipe_id="+recipe_id;	 
	 
 }
 
 </script>
<html>
<head>
	<jsp:include page="../layout/head.jsp"/>
	<link rel="stylesheet" href="/ssgssag/resources/css/recipe.css">
	<link rel="stylesheet" href="/ssgssag/resources/css/layout.css">
</head>
<body>
	<div class="main-background">
	    <div class="pc-bg-left"></div>
	    <div class="main-container">
	        <jsp:include page="../layout/header.jsp" />
	        <div class="content-container">
				<form name="rForm" action="recipe_search.ssg" method="get">
					<select name="type">
						<option value="all">전체</option>
						<option value="rcp">레시피</option>
						<option value="ing">재료</option>
					</select>
					<input type="text" name="rname" value="${recipeVO.rname }">	<!-- 검색어 -->
					<input type="submit" value="검색">
				</form>
				<div class="recipe-list-container">
					<table border="1">
						<tr>
							<td>ID</td>
							<td>이름</td>
							<td>난이도</td>
							<td colspan="2">이미지</td>
						</tr>
						<c:forEach var="vo" items="${list }">	<!-- request에 들어있는 아이템 -->
						<tr>
							<td>${vo.recipe_id }</td>
							<td>${vo.recipe_name }</td>
							<td>${vo.level }</td>
							<td><img src = "${vo.recipe_img }" width="200" height="200" ></td>
							<td><input type="button" value="상세보기" onclick="rcp_des(${vo.recipe_id})"></td>
						</tr>
						</c:forEach>
					</table>
				</div>
	        </div>			
	        <jsp:include page="../layout/menu.jsp" />
	    </div>
	    <div class="pc-bg-right"></div>
	</div>

</body>
</html>
