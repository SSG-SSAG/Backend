<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>

<script>

<!--
var flag = "rcp"
 -->

function goPage(id, name) {
	 location.href = "recipe_des.ssg?recipe_id=" + id + "&recipe_name=" + name;
}

function srch_sort() {
	rForm.submit();	// form 자체를 통째로 전송
} 

function movepage(page_num, sort, type, rname, total_count,flag) {
	
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
	
	
	var s = "recipe_search.ssg?curpage=" + page_num;
	if (sort != "" && sort != null) {
		s += "&sort=" + sort;
	} 
	if (type != "" && type != null) {
		s += "&type=" + type;		
	} 
	if (rname != "" && rname != null) {
		s += "&rname=" + rname;
	} 
	location.href = s;
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
	        <div class="content-container ccenter-layout">
				<form name="rForm" action="recipe_search.ssg" method="get">
					<select name="sort" onchange="srch_sort()">
			              <option value="name" <c:if test="${recipeVO.sort == 'name' }">selected</c:if>>가나다순</option>
			              <option value="like" <c:if test="${recipeVO.sort == 'like' }">selected</c:if>>인기순</option>
			              <option value="level" <c:if test="${recipeVO.sort == 'level' }">selected</c:if>>난이도순</option>
          			</select>
		            <select name="type">
		                <option value="all" <c:if test="${recipeVO.type == 'all' }">selected</c:if>>전체</option>
		                <option value="rcp" <c:if test="${recipeVO.type == 'rcp' }">selected</c:if>>레시피</option>
		                <option value="ing" <c:if test="${recipeVO.type == 'ing' }">selected</c:if>>재료</option>
		            </select>
					<input type="text" name="rname" value="${recipeVO.rname }">	<!-- 검색어 -->
					<input type="submit" value="검색">
					<input type="hidden" name="curpage" value="1">
				</form>
				<div class="recipe-list-container">
					<c:forEach var="vo" items="${list }" varStatus="status">	<!-- request에 들어있는 아이템 -->
						<div class="card recipe-card" onclick="goPage(${vo.recipe_id}, '${vo.recipe_name}')">
							<h5 style="margin: 0;">${vo.recipe_name }</h5>
							<div class="recipe-desc-box">
								<img class="rcard-img" src="${vo.recipe_img }" alt="${vo.recipe_name }" >
								<div class="recipe-desc">
							      <p>우렁은 우렁우렁</p>
							    </div>
							</div>
						</div>
					</c:forEach>
					<input type="button" value="이전" onclick="movepage('${recipeVO.curpage }', '${recipeVO.sort}', '${recipeVO.type }', '${recipeVO.rname }', '${recipeVO.total_count }','1');">
					<div>
					    <c:forEach var="n" items="${page }">
					   <a href="#;" onclick="movepage(${n }, '${recipeVO.sort}', '${recipeVO.type }', '${recipeVO.rname }', '${recipeVO.total_count }','0');"
					<c:if test="${n eq recipeVO.curpage}">style="font-weight:900"</c:if>>${n}</a>
					</c:forEach>
					</div>
					<input type="button" value="다음" onclick="movepage('${recipeVO.curpage }', '${recipeVO.sort}', '${recipeVO.type }', '${recipeVO.rname }', '${recipeVO.total_count }','2');">
				</div>
			    </div>			
      		<jsp:include page="../layout/menu.jsp" />
 		 </div>
  		<div class="pc-bg-right"></div>
	</div>
</body>
</html>
