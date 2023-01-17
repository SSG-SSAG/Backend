<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="header">
	<div>
		<img class="header-logo" src="/ssgssag/resources/img/ssg-ssag-logo.png" />
	</div>
	<div>
		<c:if test="${not empty currentUser }">
			<i class="fa-solid fa-cart-shopping fa-lg cart" onclick="goCart(${currentUser.user_no});"></i>
		</c:if>
		<c:if test="${empty currentUser }">
			<i class="fa-solid fa-cart-shopping fa-lg cart" onclick="login();"></i>
		</c:if>
	</div>
</div>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

function goCart(no) {
	location.href="recipe/cart.ssg?no="+no;			
}

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
