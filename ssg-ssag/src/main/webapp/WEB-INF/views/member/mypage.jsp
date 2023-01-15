<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>

function goPage(pg, id, name, cat, cname) {
	if (pg == 1) {
		location.href = "../";
	} else if (pg == 2) {	// 다음 페이지로 이동
		location.href = "../recipe/recipe_tag.ssg?tag_id=" + id + "&tag_name=" + name + "&cat=" + cat + "&category_name=" + cname;
	}
}

</script>
 
<html>
<head>
	<jsp:include page="../layout/head.jsp"/>
	<link rel="stylesheet" href="/ssgssag/resources/css/recipe.css">
	<link rel="stylesheet" href="/ssgssag/resources/css/component.css">	
</head>
<body>
<div class="main-background">
    <div class="pc-bg-left"></div>
    <div class="main-container">
        <jsp:include page="../layout/header.jsp" />
        <div class="content-container">
			<table border="1">
				<h3>${currentUser.name }님이 관심 있는 태그예요</h3>	
				<tr>
					<td></td>
					<td>카테고리</td>
					<td>#관심태그</td>
					<td></td>
				</tr>
				<c:forEach var="vo" items="${list_tags }" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${vo.category_name }</td>
					<td>${vo.tag_name }</td>
					<td><button onclick="goPage(2, ${vo.tag_id}, '${vo.tag_name}', ${vo.category_id }, '${vo.category_name}')">레시피 보러가기</button></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<jsp:include page="../layout/menu.jsp" />
	    </div>
	<div class="pc-bg-right"></div>
</div>
</body>
</html>
