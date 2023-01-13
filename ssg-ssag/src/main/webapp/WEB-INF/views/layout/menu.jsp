<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../layout/head.jsp"/>
	<link rel="stylesheet" href="/ssgssag/resources/css/menu.css">
	<link rel="stylesheet" href="/ssgssag/resources/css/layout.css">
</head>
<script src="https://kit.fontawesome.com/557d23e359.js" crossorigin="anonymous"></script>
<body>
	<div class="menu-bar">
		<div class="menu-btn">
			<a href="/ssgssag">
				<i class="fa-solid fa-house fa-lg menu-icon"></i>
				<p>홈</p>
			</a>
		</div>
		<div class="menu-btn">
			<a href="/ssgssag/recipe/recipe_search.ssg">
				<i class="fa-solid fa-utensils fa-lg menu-icon"></i>
				<p>레시피</p>
			</a>
		</div>
		<div class="menu-btn">
			<a href="/ssgssag/recipe/myrecipe.ssg">
				<i class="fa-solid fa-heart fa-lg menu-icon"></i>
				<p>찜</p>
			</a>
		</div>
		<div class="menu-btn">
			<a href="/ssgssag/refg.ssg?no=${currentUser.user_no }">
				<i class="fa-solid fa-bookmark fa-lg menu-icon"></i>
				<p>냉장고</p>
			</a>
		</div>
		<div class="menu-btn">
			<a href="/ssgssag/auth/login.ssg">
				<i class="fa-solid fa-right-to-bracket fa-lg menu-icon"></i>
				<p>로그인</p>
			</a>
		</div>
	</div>
</body>
</html>