<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	            	<div class="card step-recipe-card rcenter-layout" style="border: 1px solid black">
						<img class="step-recipe-card-img" src="${recipeVO.recipe_img }" alt="${recipeVO.recipe_name }" >
						<div class="step-recipe-desc-box">
							<div class="recipe-desc-title-box">
								<h5 class="space-strip">${recipeVO.recipe_name }</h5>
								<!-- 좋아요 여부에 따라서 보여주는 아이콘 분기 처리 + 클릭에 따라 넣었다가 뺐다가 하기 -->
								<i class="fa-solid fa-heart"></i>
								<i class="fa-regular fa-heart"></i>				
							</div>
							<div class="recipe-desc">
						      <p>태그 버튼 자리임</p>
						      <p>영양정보 담을 거임</p>
						      <form action="/recipe/recipe_like/recipe_id=${recipeVO.recipe_id }" method="post">
						      	<button type="submit">좋아요 기능 확인</button>
						      </form>
						    </div>
						</div>
					</div>
					<div class="card step-recipe-ing-card" onclick="goPage(1, 2, ${recipeVO.recipe_id}, '${recipeVO.recipe_name}');">
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
	
	// 좋아요(찜)
	
	
</script>
<jsp:include page="/WEB-INF/views/layout/import_scripts.jsp"/>

</html>