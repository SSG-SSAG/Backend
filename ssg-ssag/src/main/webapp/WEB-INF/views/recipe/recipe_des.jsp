<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
	            <div class="step-recipe-container">
	            	<div class="card step-recipe-card">
						<h5 style="margin: 0;">${recipeVO.recipe_name }</h5>
						<div class="recipe-desc-box">
							<img class="step-recipe-card-img" src="${list_des.recipe_img }" alt="${recipeVO.recipe_name }" >
							<div class="recipe-desc">
								<p>kcal ${list_des.calrorie }</p>
								<p>탄수화물 ${list_des.info_car }</p>
								<p>단백질 ${list_des.info_pro }</p>
								<p>지방 ${list_des.info_fat }</p>
								<p>나트륨 ${list_des.info_na }</p>
						      <p>태그 버튼 자리임</p>
						      ${recipeVO.recipe_img }
						    </div>
						</div>
					</div>
					<div class="card step-recipe-ing-card" onclick="goPage(${currentUser.user_no }, 2, ${recipeVO.recipe_id}, '${recipeVO.recipe_name}');">
						재료 목록 보기
					</div>
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
<script>
	function goPage(user_no, pg, id, name) {
		if (pg == 1) {			// 장바구니로 이동
			location.href = "cart.ssg?user_id=" + user_no + "&recipe_id=" + id + "&recipe_name=" + name;		 
		} else if (pg == 2) {	// 다음 페이지로 이동
			location.href = "recipe_ing.ssg?user_id=" + user_no + "&recipe_id=" + id + "&recipe_name=" + name;
		} else if (pg == 3) {	// 이전 페이지로 이동
			location.href = "recipe_search.ssg";
		}
	}
</script>

</html>