<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width">
<head>
	<jsp:include page="/WEB-INF/views/layout/import_head.jsp"/>
	<link rel="stylesheet" href="/ssgssag/resources/css/recipe.css">
</head>
<body>
	<div class="main-background">
	    <div class="pc-bg-left"></div>
	    <div class="main-container">
	        <jsp:include page="../layout/header.jsp" />
	        <div class="content-container ccenter-layout">
	            <div class="step-recipe-container">
	            	<div class="card step-recipe-card rcenter-layout">
						<img class="step-recipe-card-img" src="${list_des.recipe_img }" alt="${recipeVO.recipe_name }" >
						<div class="step-recipe-desc-box">
							<div class="recipe-desc-title-box">
								<h5 class="space-strip">${recipeVO.recipe_name }</h5>
								<!-- 좋아요 여부에 따라서  -->
								<i id="like-heart" class="fa-heart fa-regular fa-md"></i>
							</div>
							<div class="recipe-desc">
								<div class="recipe_desc tag" style="margin-top:10px; margin-bottom:10px;">
								<c:forEach var="vo" items="${rcp_tag }" varStatus="status">
									<div style="float:left;">
							    	<p style="font-size:20px;">#${vo.tag_name }</p>
							    	</div>
							    </c:forEach>
							    </div>
							    <div style="margin-bottom:8px">
							    <p style="font-size:15px; text-align:left">총 ${list_des.calrorie } kcal</p>
							    </div>
								<table style="text-align:left;">
									<tr>
										<th>탄수화물</th>
										<th>단백질</th>
										<th>지방</th>
										<th>나트륨</th>
									</tr>
									<tr>		
										<td>${list_des.info_car }</td>
										<td>${list_des.info_pro }</td>
										<td>${list_des.info_fat }</td>
										<td>${list_des.info_na }</td>
									</tr>
								</table>
							    ${recipeVO.recipe_img }
						    </div>
						</div>
					</div>
					<c:if test="${not empty currentUser.user_no}">
						<div class="card step-recipe-ing-card" onclick="goPage(${currentUser.user_no }, 2, ${recipeVO.recipe_id}, '${recipeVO.recipe_name}');">
							재료 목록 보기
						</div>
					</c:if>
					<c:if test="${empty currentUser.user_no}">
						<div class="card step-recipe-ing-card" onclick="goPage(-1, 2, ${recipeVO.recipe_id}, '${recipeVO.recipe_name}');">
							재료 목록 보기
						</div>
					</c:if>
	            </div>
	            <div class="step-list-container">
					<c:forEach var="vo" items="${list_step }" varStatus="status">
						<div class="card step-card" style="display: flex; flex-direction: row;">
							<div class="step-card-body">
								<div class="step-card-num">
									<h5 class="step-card-title">${status.count}</h5>
								</div>
								<img class="scard-img" src="${vo.dsc_img }" alt="${vo.dsc_img }" >
								<div class="step-desc">
								  <p class="step-desc-p">${vo.description}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
	        </div>			
	        
	        <jsp:include page="../layout/menu.jsp" />
	    </div>
	    <div class="pc-bg-right"></div>
	</div>
</body>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
function goPage(user_no, pg, id, name) {
	if (pg == 1) {			// 장바구니로 이동
		location.href = "cart.ssg?user_id=" + user_no + "&recipe_id=" + id + "&recipe_name=" + name;		 
	} else if (pg == 2) {	// 다음 페이지로 이동
		if (user_no == -1){
			location.href = "recipe_ing.ssg?recipe_id=" + id + "&recipe_name=" + name;			
		} else {
			location.href = "recipe_ing.ssg?user_id=" + user_no + "&recipe_id=" + id + "&recipe_name=" + name;			
		}
		/* location.href = "recipe_ing.ssg?user_id=" + user_no + "&recipe_id=" + id + "&recipe_name=" + name; */
	} else if (pg == 3) {	// 이전 페이지로 이동
		location.href = "recipe_search.ssg";
	}
}
	
	// 좋아요(찜)
	// 렌더링 전에 미리 확인하고 붙여야 함
	$(document).ready(function () {
		
		// 좋아요 여부 확인하자
		// 로그인한 유저지만 좋아요를 누르지 않았거나 비로그인 상태라면 recipeLike가 null이다
		let recipeLike = '${recipeLike.user_no }';
		// 세션에 아예 값이 널일떄는 찾아오질 못한다 흑흑
		if (recipeLike != '') {
			//recipeLike = ${recipeLike.user_no };
			console.log('이미 좋아요 누르셨네요!');
			$("#like-heart").prop("class", "fa-heart fa-solid fa-md"); // 채운 하트로 띄워주기						
		} else {
			// 좋아요 안 누름
			console.log('좋아요를 안 누르셨네요!')
			$("#like-heart").prop("class", "fa-heart fa-regular fa-md"); // 빈 하트로 띄워주기			
		}		

		// 좋아요 버튼 클릭시 동작하는 함수
		$("#like-heart").on("click", function() {
			const that = $("like-heart");
			console.log('하트 클릭');
			if ('${currentUser.user_no}' == '') {
				//alert('로그인 해주세요!')
				login();
			} else {
				$.ajax({
					url: '/ssgssag/recipe/recipe_like.ssg',
					type: 'POST',
					data: {'recipe_id': ${recipeVO.recipe_id}, 'user_no': ${currentUser.user_no} + ""},
					success: function(data) {
						if (data == 1) {
							console.log()
							// 새로 추가했어요
							$("#like-heart").prop("class", "fa-heart fa-solid fa-md"); // 채운 하트로 바꿔주기
						} else {
							console.log('좋아요 추ㅣ소하라고 ㅡㅡ')
							// 좋아요 취소했어요
							$("#like-heart").prop("class", "fa-heart fa-regular fa-md"); // 빈 하트로 띄워주기
						}
					},
					error: function (xhr, status, error) {
						alert('실패'); 
					}		
				})
			}
		
		});
	})
	
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
<jsp:include page="/WEB-INF/views/layout/import_scripts.jsp"/>
</html>