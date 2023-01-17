<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/ssgssag/resources/css/component.css">
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
			<c:if test="${not empty currentUser }">
				<a href="/ssgssag/recipe/myrecipe.ssg?user_no=${currentUser.user_no }">
					<i class="fa-solid fa-heart fa-lg menu-icon"></i>
					<p>찜</p>
				</a>
			</c:if>
			<c:if test="${empty currentUser }">
				<!-- <a href="/ssgssag/" onclick="alert('로그인 후 이용해주세요')"> -->
				<a href="javascript:void(0);" onclick="login();">
					<i class="fa-solid fa-heart fa-lg menu-icon"></i>
					<p>찜</p>
				</a>
			</c:if>
		</div>
		<div class="menu-btn">
			<c:if test="${not empty currentUser }">
				<a href="/ssgssag/member/mypage.ssg?user_no=${currentUser.user_no }">
					<i class="fa-solid fa-bookmark fa-lg menu-icon"></i>
					<p>냉장고</p>
				</a>
			</c:if>
			<c:if test="${empty currentUser }">
				<!-- <a href="/ssgssag/" onclick="alert('로그인 후 이용해주세요')"> -->
				<a href="javascript:void(0);" onclick="login();">
					<i class="fa-solid fa-bookmark fa-lg menu-icon"></i>
					<p>냉장고</p>
				</a>
			</c:if>
		</div>
		<div class="menu-btn">
			<c:if test="${empty currentUser}">
				<a href="/ssgssag/auth/login.ssg">
					<i class="fa-solid fa-right-to-bracket fa-lg menu-icon"></i>
					<p>로그인</p>
				</a>
			</c:if>
			<c:if test="${not empty currentUser }">
				<a href="/ssgssag/member/mypage.ssg?user_no=${currentUser.user_no }">
					<i class="fa-solid fa-user fa-lg menu-icon"></i>
					<p>마이페이지</p>
				</a>
			</c:if>
		</div>
	</div>
</body>
</html>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

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