<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/ssgssag/resources/css/component.css">
	<link rel="stylesheet" href="/ssgssag/resources/css/menu.css?after">
	<link rel="stylesheet" href="/ssgssag/resources/css/layout.css">
</head>
<script src="https://kit.fontawesome.com/557d23e359.js" crossorigin="anonymous"></script>
<body>
	<div class="menu-bar">
		<div id="menu-home-box" class="menu-btn">
			<a href="/ssgssag">
				<i id="menu-home" class="fa-solid fa-house fa-lg menu-icon"></i>
				<p class="menu-icon-name">홈</p>
			</a>
		</div>
		<div id="menu-recipe-box" class="menu-btn">
			<a href="/ssgssag/recipe/recipe_search.ssg">
				<i id="menu-recipe" class="fa-solid fa-cookie fa-lg menu-icon"></i>
				<p class="menu-icon-name">레시피</p>
			</a>
		</div>
		<div id="menu-like-box" class="menu-btn">
			<c:if test="${not empty currentUser }">
				<a href="/ssgssag/recipe/myrecipe.ssg?user_no=${currentUser.user_no }">
					<i id="menu-like-1" class="fa-solid fa-heart fa-lg menu-icon"></i>
					<p class="menu-icon-name">찜</p>
				</a>
			</c:if>
			<c:if test="${empty currentUser }">
				<a href="javascript:void(0);" onclick="login();">
					<i id="menu-like-2" class="fa-solid fa-heart fa-lg menu-icon"></i>
					<p class="menu-icon-name">찜</p>
				</a>
			</c:if>
		</div>
		<div id="menu-refg-box" class="menu-btn">
			<c:if test="${not empty currentUser }">
				<a href="/ssgssag/member/refg.ssg?no=${currentUser.user_no }">
					<i id="menu-refg-1" class="fa-solid fa-box fa-lg menu-icon"></i>
					<p class="menu-icon-name">냉장고</p>
				</a>
			</c:if>
			<c:if test="${empty currentUser }">
				<a href="javascript:void(0);" onclick="login();">
					<i id="menu-refg-2" class="fa-solid fa-box fa-lg menu-icon"></i>
					<p class="menu-icon-name">냉장고</p>
				</a>
			</c:if>
		</div>
		<div id="menu-member-box" class="menu-btn">
			<c:if test="${empty currentUser}">
				<a href="/ssgssag/auth/login.ssg">
					<i id="menu-login" class="fa-solid fa-door-open fa-lg menu-icon" ></i>
					<p class="menu-icon-name">로그인</p>
				</a>
			</c:if>
			<c:if test="${not empty currentUser }">
				<a href="/ssgssag/member/mypage.ssg?user_no=${currentUser.user_no }">
					<i id="menu-mypage" class="fa-solid fa-user fa-lg menu-icon"></i>
					<p class="menu-icon-name">마이쓱싹</p>
				</a>
			</c:if>
		</div>
	</div>
</body>
</html>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

// 로그인 알림창
function login(){
	new swal({
		title : '로그인 후 이용해주세요.',
		icon : 'error',
		confirmButtonText: '확인',
	}).then((result) => {
		if(result.value) {
			location.href="/ssgssag/auth/login.ssg";
		}
	});
}
</script>