<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<form name="rForm" action="recipe_search.ssg" method="get">
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
					태그 들어갈 자리
					${currentUser.name }
				</div>
				<div>
					냉장고 간단 정보 넣을 자리
					<h4>${currentUser.name }님 하이 </h4>
					<h4>${currentUser.id }님 하이 </h4>
					<h4>${currentUser.user_no }님 하이 </h4>
				</div>
			</div>			
			<jsp:include page="layout/menu.jsp" />
		</div>
		<div class="pc-bg-right"></div>
	</div>
</body>
</html>
