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
								<table style="text-align:center;">
									<tr>
										<th>kcal</th>
										<th>탄수화물</th>
										<th>단백질</th>
										<th>지방</th>
										<th>나트륨</th>
									</tr>
									<tr>
										<td>${list_des.calrorie }</td>
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
						<div class="card step-recipe-ing-card" onclick="page(${currentUser.user_no}, 1, ${recipeVO.recipe_id } );">
							장바구니로 쓰윽
						</div>
					</c:if>
				</div>
	            <%-- <div class="ing-recipe-container">
	            	<div class="card step-recipe-card" style="margin-top: 10px;">
						<h5 style="margin: 0;">${recipeVO.recipe_name }</h5>
						<div class="recipe-desc-box">
							<img class="step-recipe-card-img" src="${list_des.recipe_img }" alt="${recipeVO.recipe_name }" >
							<div class="recipe-desc">
							    <p>${list_des.calrorie }kcal</p>
								<p>탄수화물 ${list_des.info_car }</p>
								<p>단백질 ${list_des.info_pro }</p>
								<p>지방 ${list_des.info_fat }</p>
								<p>나트륨 ${list_des.info_na }</p>
							    <c:forEach var="vo" items="${rcp_tag }" varStatus="status">
							    	<p>#${vo.tag_name }</p>
							    </c:forEach>
						    </div>
						</div>
					</div>
	            </div> --%>
	            <div class="ing-list-container" >
					<c:forEach var="vo" items="${list_notmine }" varStatus="status">
						<div class="card step-card" style="display: flex; flex-direction: row;">
							<div class="step-card-body">
							    <p class="step-desc-p">${vo.ing_name}</p>
							    <c:if test="${not empty currentUser.user_no}">
							    	
							    	<p class="step-desc-p">사야합니다.</p>
							    										
								</c:if>
							</div>
						</div>
					</c:forEach>
					<c:forEach var="vo" items="${list_mine }" varStatus="status">
						<div class="card step-card" style="display: flex; flex-direction: row; background:green;">
							<div class="step-card-body">
							    <p class="step-desc-p">${vo.ing_name}</p>
							    <c:if test="${not empty currentUser.user_no}">
							    	<p class="step-desc-p">이미 있지롱.</p>
							    										
								</c:if>
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
	function page(user_no, pg, recipe_id) {
		 if (pg == 1){			// 장바구니로 이동
			console.log("dadf0");
			location.href="../cart.ssg?no="+user_no + "&recipe_id=" + recipe_id;
		 } else if (pg == 2){	// 이전 페이지로 이동
		 	location.href="recipe_des.ssg?user_id="+user_no + "&recipe_id=" + recipe_id + "&recipe_name=" + name;
		 }		 
	}
</script>
<jsp:include page="/WEB-INF/views/layout/import_scripts.jsp"/>
</html>