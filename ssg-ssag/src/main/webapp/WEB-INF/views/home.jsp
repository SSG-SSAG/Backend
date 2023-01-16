<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
function goTag(cat, name) {
	location.href="recipe/recipe_cat.ssg?cat=" + cat + "&category_name=" + name;
}

function goCart(no) {
	location.href="recipe/cart.ssg?no="+no;
}
</script>

<html>
<head>
	<jsp:include page="layout/head.jsp"/>	
	<link rel="stylesheet" href="resources/css/layout.css">
	
</head>
<body>
	<div class="main-background">
		<div class="pc-bg-left"></div>
		<div class="main-container">
			<jsp:include page="layout/header.jsp" />
			<div class="content-container">
				<div>
					<form name="rForm" action="recipe/recipe_search.ssg" method="get">
						<select name="type">
							<option value="all">전체</option>
							<option value="rcp">레시피</option>
							<option value="ing">재료</option>
						</select>
						<input type="text" name="rname" value="${recipeVO.rname }">	<!-- 검색어 -->
						<input type="submit" value="검색" class="main-btn">
					</form>
				</div>
				<div>
					<h3>태그로 검색하러 가기!</h3>
					<input type="button" value="종류" onclick="goTag(1, '종류');">
					<input type="button" value="건강" onclick="goTag(2, '건강');">
					<input type="button" value="테마" onclick="goTag(3, '테마');">
				<input type="button" value="조리법" onclick="goTag(4, '조리법');">
					${currentUser.name }
				</div>
				<div>
					<input type="button" value="장바구니 ㄱ" onclick="goCart(${currentUser.user_no});">
					<h4>${currentUser.name }님 하이 </h4>
				</div>
			</div>
			<jsp:include page="layout/menu.jsp" />
		</div>
		<div class="pc-bg-right"></div>
	</div>
</body>
</html>
