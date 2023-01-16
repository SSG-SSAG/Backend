<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<!DOCTYPE html>
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
        <div class="content-container ccenter-layout">
			<h2>${param.category_name}의 #${recipeVO.tag_name} 레시피 모음 </h2>
			<form name="rForm" action="recipe_tag.ssg" method="get">
				<!-- 정렬 기준 -->
				<select name="sort" onchange="srch_sort()">
					<option value="name" <c:if test="${recipeVO.sort == 'name' }">selected</c:if>>가나다순</option>
					<option value="like" <c:if test="${recipeVO.sort == 'like' }">selected</c:if>>인기순</option>
					<option value="level" <c:if test="${recipeVO.sort == 'level' }">selected</c:if>>난이도순</option>
				</select>
				<input type="hidden" name="tag_id" value="${recipeVO.tag_id }">
				<input type="hidden" name="tag_name" value="${recipeVO.tag_name }">
			</form>
			
			<input type="button" value="다시 선택" onclick="goPage(3, ${param.cat}, '${param.category_name}')">
			
			<div class="recipe-list-container">
				<c:forEach var="vo" items="${list_tag }" varStatus="status">	<!-- request에 들어있는 아이템 -->
				<div class="card recipe-card" onclick="goPage(2, ${vo.recipe_id}, '${vo.recipe_name}')">
					<h5 style="margin: 0;">${vo.recipe_name }</h5>
					<div class="recipe-desc-box">
						<img class="rcard-img" src="${vo.recipe_img }" alt="${vo.recipe_name }" >
						<div class="recipe-desc">
					      <p>우렁은 우렁우렁</p>
					    </div>
					</div>
				</div>
				</c:forEach>
				<nav>
					<ul class="pagination">
					    <li class="page-item">
					    <button class="page-link" 
					        onclick="movepage('${recipeVO.curpage }', '${recipeVO.sort}', '${recipeVO.type }', '${recipeVO.rname }', '${recipeVO.total_count }','1');" aria-label="Previous">
					      <span aria-hidden="true" class="ssg-page">이전</span>
					    </button>
						</li>
					  	<c:forEach var="n" items="${page }">
							<li class="page-item">
						    	<button class="page-link ssg-page" onclick="movepage(${n }, '${recipeVO.sort}', '${recipeVO.type }', '${recipeVO.rname }', '${recipeVO.total_count }','0');"
								<c:if test="${n eq recipeVO.curpage}">style="font-weight:500; background: rgba(163, 144, 122, 0.8);"</c:if>><span class="ssg-page">${n}</span></button>
							</li>
						</c:forEach>
						<li class="page-item">
					  		<button class="page-link" 
				     			onclick="movepage('${recipeVO.curpage }', '${recipeVO.sort}', '${recipeVO.type }', '${recipeVO.rname }', '${recipeVO.total_count }','2');" aria-label="Next">
					        <span aria-hidden="true" class="ssg-page">다음</span>
				     		</button>
					    </li>
					</ul>
				</nav>
			</div>
		</div>
		<jsp:include page="../layout/menu.jsp" />
	    </div>
	<div class="pc-bg-right"></div>
</div>
</body>
</html>
