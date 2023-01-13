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
	<title>Recipe Main</title>
</head>
<body>
<h2>레시피 메인 페이지</h2>
<h3>레시피 검색 결과</h3>

<form name="rForm" action="recipe_search.ssg" method="get">
	<!-- 정렬 기준 -->
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

<input type="button" value="이전" onclick="movepage('${recipeVO.curpage }', '${recipeVO.sort}', '${recipeVO.type }', '${recipeVO.rname }', '${recipeVO.total_count }','1');">

<c:forEach var="n" items="${page }">
	
	<a href="#;" onclick="movepage(${n }, '${recipeVO.sort}', '${recipeVO.type }', '${recipeVO.rname }', '${recipeVO.total_count }','0');"
		<c:if test="${n eq recipeVO.curpage}">style="font-weight:900"</c:if>
	>
		${n}
	</a>
	 
</c:forEach>

<input type="button" value="다음" onclick="movepage('${recipeVO.curpage }', '${recipeVO.sort}', '${recipeVO.type }', '${recipeVO.rname }', '${recipeVO.total_count }','2');">

<table border="1">
	<tr>
		<td></td>
		<td>ID</td>
		<td>이름</td>
		<td>난이도</td>
		<td>좋아요</td>
		<td colspan="2">이미지</td>
	</tr>
	<c:forEach var="vo" items="${list }" varStatus="status">	<!-- request에 들어있는 아이템 -->
	<tr>
		<td>${status.count}</td>
		<td>${vo.recipe_id }</td>
		<td>${vo.recipe_name }</td>
		<td>${vo.level }</td>
		<td>${vo.cnt }</td>
		<td><img src = "${vo.recipe_img }" width="200" height="200" ></td>
		<td><input type="button" value="상세보기" onclick="goPage(${vo.recipe_id}, '${vo.recipe_name}')"></td>
	</tr>
	</c:forEach>
</table>

</body>
</html>
