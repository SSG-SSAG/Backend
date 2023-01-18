<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/import_head.jsp"/>
	<link rel="stylesheet" href="/ssgssag/resources/css/recipe.css">
</head>
<body>
<div class="main-background">
    <div class="pc-bg-left"></div>
    <div class="main-container">
        <jsp:include page="../layout/header.jsp" />
        <div class="content-container ccenter-layout">
			<h3>${currentUser.name }님이 관심 있는 레시피</h3>
			<h3>레시피 구경하고 장바구니에 ssag 담아보세요~!</h3>
			
			<form name="rForm" action="recipe_tag.ssg" method="get">
				<input type="hidden" name="tag_id" value="${recipeVO.tag_id }">
				<input type="hidden" name="tag_name" value="${recipeVO.tag_name }">
			</form>
			
			<div class="recipe-list-container">
				<c:forEach var="vo" items="${list_my }" varStatus="status">
					<div class="card recipe-card" onclick="goPage(1, ${vo.recipe_id}, '${vo.recipe_name}')">
						<h5 style="margin: 0;">${vo.recipe_name }</h5>
						<div class="recipe-desc-box">
							<img class="rcard-img" src="${vo.recipe_img }" alt="${vo.recipe_name }" >
							<div class="recipe-desc">
						      <p>${vo.recipe_ing_info }</p>
						      <c:forEach var="vo2" items="${rcp_tag }" varStatus="status">
							  	<p>#${vo2.tag_name }</p>
							  </c:forEach>
						      <p>찜 ${vo.cnt }</p>
						      <p>난이도 ${vo.level }</p>
						    </div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<jsp:include page="../layout/menu.jsp" />
	    </div>
	<div class="pc-bg-right"></div>
</div>

</body>
<script>
	function goPage(pg, id, name) {
		if (pg == 1) {
			location.href = "recipe_des.ssg?recipe_id=" + id + "&recipe_name=" + name;		
		} else if (pg == 2) {	// 다음 페이지로 이동
			location.href = "recipe_des.ssg?recipe_id=" + id + "&recipe_name=" + name;
		} else if (pg == 3) {	// 이전 페이지로 이동
			location.href = "recipe_cat.ssg?cat=" + id + "&category_name=" + name;
		}
	}
	
	function srch_sort() {
		rForm.submit();	// form 자체를 통째로 전송
	}
</script>
<jsp:include page="/WEB-INF/views/layout/import_scripts.jsp"/>
</html>
