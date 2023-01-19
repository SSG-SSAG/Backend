<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width">
<head>
	<jsp:include page="/WEB-INF/views/layout/import_head.jsp"/>
	<link rel="stylesheet" href="/ssgssag/resources/css/recipe.css">
	<link rel="stylesheet" href="/ssgssag/resources/css/recipe-tag.css">
	
</head>
<body>
<div class="main-background">
    <div class="pc-bg-left"></div>
    <div class="main-container">
        <jsp:include page="../layout/headerBack.jsp" />
        <div class="content-container ccenter-layout">
        <div class="tag-title-container">
        	<div class="upper-tag"><h4>#${param.category_name}</h4></div>
        	<div class="main-tag"><h3 class="detail-tag-title"> #${recipeVO.tag_name} </h3></div>
        </div>
			<form name="rForm" action="recipe_tag.ssg" method="get">
				<!-- 정렬 기준 -->
				<select name="sort" onchange="srch_sort()">
					<option value="name" <c:if test="${recipeVO.sort == 'name' }">selected</c:if>>가나다순</option>
					<option value="like" <c:if test="${recipeVO.sort == 'like' }">selected</c:if>>인기순</option>
					<option value="level" <c:if test="${recipeVO.sort == 'level' }">selected</c:if>>난이도순</option>
				</select>
				<input type="hidden" name="tag_id" value="${recipeVO.tag_id }">
				<input type="hidden" name="tag_name" value="${recipeVO.tag_name }">
				<input type="hidden" name="cat" value="${recipeVO.cat }">
				<input type="hidden" name="category_name" value="${recipeVO.category_name }">
			</form>
						
			<div class="recipe-list-container">
				<c:forEach var="vo" items="${list_tag }" varStatus="status">	<!-- request에 들어있는 아이템 -->
				<div class="card recipe-card" onclick="goPage(2, ${vo.recipe_id}, '${vo.recipe_name}')">
					<h5 style="margin: 0;">${vo.recipe_name } ${vo.star }</h5>
					<p style="text-align: right;">${vo.cnt } <i class="fa-solid fa-heart fa-lg heart"></i></p>
					<div class="recipe-desc-box">
						<img class="rcard-img" src="${vo.recipe_img }" alt="${vo.recipe_name }" >
						<div class="recipe-desc">
					      <p>${vo.recipe_ing_info }</p>
					    </div>
					</div>
				</div>
				</c:forEach>
				<nav>
					<ul class="pagination">
					    <li class="page-item">
					    <button class="page-link" 
					        onclick="movepage('${recipeVO.curpage }', '${recipeVO.sort}','${recipeVO.tag_id }', '${recipeVO.tag_name }', '${param.cat}', '${param.category_name}','${recipeVO.total_count }','1');" aria-label="Previous">
					      <span aria-hidden="true" class="ssg-page">이전</span>
					    </button>
						</li>
					  	<c:forEach var="n" items="${page }">
							<li class="page-item">
						    	<button class="page-link ssg-page" onclick="movepage(${n }, '${recipeVO.sort}','${recipeVO.tag_id }', '${recipeVO.tag_name }', '${param.cat}', '${param.category_name}', '${recipeVO.total_count }','0');"
								<c:if test="${n eq recipeVO.curpage}">style="font-weight:500; background: rgba(163, 144, 122, 0.8);"</c:if>><span class="ssg-page">${n}</span></button>
							</li>
						</c:forEach>
						<li class="page-item">
					  		<button class="page-link" 
				     			onclick="movepage('${recipeVO.curpage }', '${recipeVO.sort}','${recipeVO.tag_id }', '${recipeVO.tag_name }', '${param.cat}', '${param.category_name}', '${recipeVO.total_count }','2');" aria-label="Next">
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
	
	function movepage(page_num, sort, id, name, cat, cat_name, total_count,flag) {
		
		if (page_num == "" && page_num == null) {
			page_num = "1"
		}
		if (flag == "1") {
			if (page_num == "1") {
				page_num = "1";
			}
			else {
				var temp = parseInt(page_num);
				temp -= 1;
				page_num = String(temp);
			}
		}
		if (flag == "2") {
			if ( parseInt(page_num) < parseInt(total_count)){
				var temp = parseInt(page_num);
				temp += 1
				page_num = String(temp);
			}
		}
		
		
		var s = "recipe_tag.ssg?curpage=" + page_num;
		if (sort != "" && sort != null) {
			s += "&sort=" + sort;
		} 
		s += "&tag_id=" + id;
		s += "&tag_name=" + name;
		s += "&cat=" + cat;
		s += "&category_name=" + cat_name;
		
	
		location.href = s;
	} 
	
</script>
<jsp:include page="/WEB-INF/views/layout/import_scripts.jsp"/>
</html>
