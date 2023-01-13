<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="../layout/head.jsp"/>
	<link rel="stylesheet" href="/ssgssag/resources/css/recipe.css">
	<link rel="stylesheet" href="/ssgssag/resources/css/component.css"></head>
<body>
	<div class="main-background">
	    <div class="pc-bg-left"></div>
	    <div class="main-container">
	        <jsp:include page="../layout/header.jsp" />
	        <div class="content-container">
	        	<div class="step-top-container">
	        		<div>
	        			뒤로 가기
	        		</div>
	        		<div>
	        			재료 리스트
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