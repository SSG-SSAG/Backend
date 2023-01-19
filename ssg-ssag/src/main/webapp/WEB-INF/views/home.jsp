<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<meta name="viewport" content="width=device-width">
<head>
	<jsp:include page="/WEB-INF/views/layout/import_head.jsp"/>
	<link rel="stylesheet" href="/ssgssag/resources/css/home.css">
</head>
<body>
	<div class="main-background">
		<div class="pc-bg-left"></div>
		<div class="main-container">
			<jsp:include page="layout/header.jsp" />
			<div class="content-container">
				<div>
					<h4 class="home-recipe-title">🔥쓱-싹 인기 레시피🔥</h4>
					<div id="hotRecipeCarousel" class="carousel slide" data-bs-ride="carousel" data-touch="true" data-interval="2000">
					  <div class="carousel-inner">
					  	<c:forEach var="vo" items="${hotRecipe_list }" varStatus="status">
								<div class="carousel-item hot-recipe-card <c:if test="${status.first }">active</c:if>" onclick="goPage(${vo.recipe_id}, '${vo.recipe_name}')">
						      <div class="hot-recipe-img ccenter-layout" style="background-image: url(${vo.recipe_img }); no-repeat">
						        <h5 class="hot-recipe-title">${vo.recipe_name }</h5>
						        <div class="hot-recipe-tag">${vo.tags }</div>
						      </div>
						    </div>
							</c:forEach>
					  </div>
					  <button class="carousel-control-prev" type="button" data-bs-target="#hotRecipeCarousel" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#hotRecipeCarousel" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </button>
					</div>
				</div>
				<div class="main-tag-container">
					<h4 class="home-recipe-title">#태그별로 쓱! 👀</h4>
					<div class="main-tag-grid">
						<div class="main-tag-card tag-1" onclick="goTag(1, '종류');">종류</div>
						<div class="main-tag-card tag-2" onclick="goTag(2, '건강');">건강</div>
						<div class="main-tag-card tag-3" onclick="goTag(3, '테마');">테마</div>
						<div class="main-tag-card tag-4" onclick="goTag(4, '조리법');">조리법</div>		
					</div>
				</div>
			</div>
			<jsp:include page="layout/menu.jsp" />
		</div>
		<div class="pc-bg-right"></div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/layout/import_scripts.jsp"/>
</html>

<script>
	function goTag(cat, name) {
		location.href="recipe/recipe_cat.ssg?cat=" + cat + "&category_name=" + name;
	}
	
	function goPage(id, name) {
		location.href="recipe/recipe_des.ssg?recipe_id=" + id + "&recipe_name=" + name;
	}
</script>
