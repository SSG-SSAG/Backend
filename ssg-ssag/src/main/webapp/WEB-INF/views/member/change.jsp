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
		location.href="change.ssg?id="+user_no;
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
				<h3>${currentUser.name }님의 회원 정보</h3>	
				<tr>
					<td>아이디</td>
					<td>비밀번호</td>
					<td>닉네임</td>
					<td>가입일</td>
					<td>이름</td>
					<td>성별</td>
					<td>생년월일</td>
				</tr>
				<c:forEach var="vo" items="${list_users }" varStatus="status">
				<tr>
					<td>${vo.id }</td>
					<td>${vo.password }</td>
					<td>${vo.nickname }</td>
					<td>${vo.reg_date }</td>
					<td>${vo.name }</td>
					<td>${vo.gender }</td>
					<td>${vo.birth_date }</td>
				</tr>
				</c:forEach>
			</table>
			
			<input type="button" value="수정" onclick="goPage(1, ${currentUser.user_no});">
		</div>
		<jsp:include page="../layout/menu.jsp" />
	    </div>
	<div class="pc-bg-right"></div>
</div>
</body>
</html>
