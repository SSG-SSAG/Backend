<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>

function goPage(pg, id, name, cat, cname) {
	if (pg == 1) {
		location.href = "../";
	} else if (pg == 2) {	// 다음 페이지로 이동
		location.href = "recipe_tag.ssg?tag_id=" + id + "&tag_name=" + name + "&cat=" + cat + "&category_name=" + cname;
	}
}

</script>

<html>
<head>
	<link rel="stylesheet" href="/ssgssag/resources/css/recipe.css">
	<link rel="stylesheet" href="/ssgssag/resources/css/component.css">	
</head>
<body>
<div class="main-background">
    <div class="pc-bg-left"></div>
    <div class="main-container">
        <jsp:include page="../layout/header.jsp" />
        <div class="content-container">
			<h2>${recipeVO.category_name} 중 원하는 #태그를 선택하세요!</h2>
			
			<c:forEach var="vo" items="${list_cat }" varStatus="status">
				<button onclick="goPage(2, ${vo.tag_id}, '${vo.tag_name}', ${param.cat}, '${param.category_name}')">#${vo.tag_name }</button>
			</c:forEach>
		</div>
	<jsp:include page="../layout/menu.jsp" />
	    </div>
	<div class="pc-bg-right"></div>
</div>

</body>
</html>
