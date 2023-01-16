<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>

function goPage(pg, id, name, cat, cname) {
	if (pg == 1) {
		location.href = "../";
	} else if (pg == 2) {	// 다음 페이지로 이동
		location.href = "../recipe/recipe_tag.ssg?tag_id=" + id + "&tag_name=" + name + "&cat=" + cat + "&category_name=" + cname;
	} else if (pg == 3) {
		location.href="deleteTag.ssg?like_tag_id="+id;
	} else if (pg == 4) {
		location.href="change.ssg?user_no="+id;
	} else if (pg == 5) {
		location.href="../recipe/cart.ssg?no="+id;
	}
}

function showTag(){
	var target = document.getElementById("addTag");
	if (target.style.display == "none") {
		target.style.display = "block";
	}
	else {
		target.style.display = "none";	
	}
}

function boxSelect(cat){
	var option = ["밥", "반찬", "찌개/국", "디저트", "한그릇"];
	var health = ["저탄고지", "저열량", "저염식", "고단백", "안매운"];
	var theme = ["안주요리", "파티요리", "이색요리", "여름별미", "겨울별미"];
	var cook = ["끓이기", "튀기기", "찌기", "굽기", "볶기", "기타"];
	var target = document.getElementById("tagBox");

	if(cat.value == "option") {
		var tag = option;
	} else if(cat.value == "health") {
		var tag = health;
	} else if(cat.value == "theme") {
		var tag = theme;
	} else if(cat.value == "cook") {
		var tag = cook;
	}

	target.options.length = 0;

	for (x in tag) {
		var opt = document.createElement("option");
		opt.value = tag[x];
		opt.innerHTML = tag[x];
		target.appendChild(opt);
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
        	<div>        	
				<h3>회원 정보 수정</h3>	
				<input type="button" value="회원 정보 수정" onclick="goPage(4, ${currentUser.user_no});">
        	</div>
        	<div>        	
				<h3>장바구니</h3>	
				<input type="button" value="장바구니" onclick="goPage(5, ${currentUser.user_no});">
        	</div>
        	<div>
			<table border="1">
				<h3>${currentUser.name }님이 관심 있는 태그예요</h3>	
				<tr>
					<td></td>
					<td>카테고리</td>
					<td>#관심태그</td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="vo" items="${list_tags }" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${vo.category_name }</td>
					<td>${vo.tag_name }</td>
					<td><button onclick="goPage(2, ${vo.tag_id}, '${vo.tag_name}', ${vo.category_id }, '${vo.category_name}')">레시피 보러가기</button></td>
					<td><button onclick="goPage(3, ${vo.like_tag_id})">삭제</button></td>
				</tr>
				</c:forEach>
			</table>

			<input type="button" value="태그추가" onclick="showTag();">
			<div id="addTag" style="display:none">
				<form name="tagForm" action="tag_new.ssg" method="get">
					<select id="catBox" name="catBox" onchange="boxSelect(this)">
						<option value="cat">관심 카테고리를 선택하세요!</option>
						<option value="option">종류</option>
						<option value="health">건강</option>
						<option value="theme">테마</option>
						<option value="cook">조리법</option>
					</select>
					<select id="tagBox" name="tag_name">
						<option>관심 있는 #태그를 선택해주세요</option>
					</select>
					<input type="submit" value="추가">
					<input type="hidden" name="user_no" value="${currentUser.user_no }">
				</form>
			</div>
        	</div>
		</div>
		<jsp:include page="../layout/menu.jsp" />
	    </div>
	<div class="pc-bg-right"></div>
</div>
</body>
</html>
