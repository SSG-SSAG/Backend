<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>

<!DOCTYPE html>
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
	            <div class="ing-recipe-container">
	            	<div class="card step-recipe-card" style="margin-top: 10px;">
						<h5 style="margin: 0;">${recipeVO.recipe_name }</h5>
						<div class="recipe-desc-box">
							<img class="step-recipe-card-img" src="${recipeVO.recipe_img }" alt="${recipeVO.recipe_name }" >
							<div class="recipe-desc">
						      <p>영양정보 담을 거임</p>
						      <p>태그 버튼 자리임</p>
						    </div>
						</div>
					</div>
	            </div>
	            <div class="ing-list-container">
					<c:forEach var="vo" items="${list_detail }" varStatus="status">
						<div class="card step-card" style="display: flex; flex-direction: row;">
							<div class="step-card-body">
							    <p class="step-desc-p">${vo.ing_name}</p>
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
	function page(user_no, pg, id, name) {
		 if (pg == 1){			// 장바구니로 이동
		 	location.href="cart.ssg?user_id="+user_no + "&recipe_id=" + id + "&recipe_name=" + name;
		 } else if (pg == 2){	// 이전 페이지로 이동
		 	location.href="recipe_des.ssg?user_id="+user_no + "&recipe_id=" + id + "&recipe_name=" + name;
		 }		 
	}
</script>
</html>