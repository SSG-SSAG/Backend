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
	        <jsp:include page="../layout/headerBack.jsp" />
	        <div class="content-container ccenter-layout">
	        	<div class="step-recipe-container">
	        		<div class="card step-recipe-card">
            <div class="recipe-desc-title-box">
              <div class="step-recipe-title-tag-box">
               <h4 class="recipe-title">${recipeVO.recipe_name }</h4>
               <div class="recipe-desc-tag">
                 <c:forEach var="vo" items="${rcp_tag }" varStatus="status">
                   <div>
                     <p>#${vo.tag_name }</p>
                   </div>
                  </c:forEach>
               </div>        	
             </div>	
             <!-- <i id="like-heart" class="fa-heart fa-regular fa-lg"></i> -->
            </div>
            <div class="rcenter-layout">
             <img class="step-recipe-card-img" src="${list_des.recipe_img }" alt="${recipeVO.recipe_name }" >
             <div class="step-recipe-desc-box ccenter-layout">
               <!-- 칼로리 정보 넣기 -->
               <p style="font-size:15px; text-align:left">총 ${list_des.calrorie } kcal</p>
               <div class="step-recipe-info-box">
                 <div class="ccenter-layout">
                   <p>탄수화물</p>
                   <p>${list_des.info_car }</p>
                 </div>
                 <div class="ccenter-layout">
                   <p>단백질</p>
                   <p>${list_des.info_pro }</p>
                 </div>
                 <div class="ccenter-layout">
                   <p>지방</p>
                   <p>${list_des.info_fat }</p>
                 </div>
                 <div class="ccenter-layout">
                   <p>나트륨</p>
                   <p>${list_des.info_na }</p>
                 </div>
               </div>
             </div>
            </div>
         </div>
				<c:if test="${not empty currentUser.user_no}">
					<div class="card step-recipe-ing-card" onclick="page(${currentUser.user_no}, 1, ${recipeVO.recipe_id } );">
						장바구니로 쓰윽
					</div>
				</c:if>
				</div>     
        <div class="ing-list-container" >
			<c:forEach var="vo" items="${list_notmine }" varStatus="status">
				<div class="card step-card" style="display: flex; flex-direction: row;">
					<div class="step-card-body">
				    <p class="step-desc-p">${vo.ing_name}</p>
				    <c:if test="${not empty currentUser.user_no}">
				    	<button onclick="ssgone('${vo.ing_id}', '${currentUser.user_no }','${recipeVO.recipe_id  }','${recipeVO.recipe_name  }');">쓱</button>				
						</c:if>
					</div>
				</div>
			</c:forEach>
			<c:forEach var="vo" items="${list_incart }" varStatus="status">
				<div class="card step-card" style="display: flex; flex-direction: row; background:#FFFACD;">
					<div class="step-card-body">
				    <p class="step-desc-p">${vo.ing_name}</p>
				    <c:if test="${not empty currentUser.user_no}">
				    	<p class="step-desc-p">(카트)</p>							
						</c:if>
					</div>
				</div>
			</c:forEach>
			<c:forEach var="vo" items="${list_mine }" varStatus="status">
				<div class="card step-card" style="display: flex; flex-direction: row; background:#FFFACD;">
					<div class="step-card-body">
				    <p class="step-desc-p">${vo.ing_name}</p>
				    <c:if test="${not empty currentUser.user_no}">
				    	<p class="step-desc-p">(보유)</p>							
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
	
	function ssgone(ing_id, user_no, id, name) {
		console.log(ing_id);
		location.href = "recipe_ing.ssg?user_id=" + user_no + "&recipe_id=" + id + "&recipe_name=" + name + "&addone=" + ing_id;		
	}
</script>
<jsp:include page="/WEB-INF/views/layout/import_scripts.jsp"/>
</html>