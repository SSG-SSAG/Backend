<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width">
<head>
	<jsp:include page="/WEB-INF/views/layout/import_head.jsp"/>
	<link rel="stylesheet" href="/ssgssag/resources/css/recipe.css">
	<link rel="stylesheet" href="/ssgssag/resources/css/cart.css">
</head>
<body>
	
<div class="main-background">
    <div class="pc-bg-left"></div>
    <div class="main-container">
        <jsp:include page="../layout/header.jsp" />
        <div class="content-container">
        	<div class="cart-container">
	        	<h3>π${currentUser.name }λμ μ₯λ°κ΅¬λπ</h3>
	        	<c:if test="${fn:length(list) == 0}">
	        		<h5 style="color:#FFB6C1;">μμ§ μ₯λ°κ΅¬λμ μλ¬΄ κ²λ μλ€μ π₯</h5>
	        		<h5>λ μνΌ κ΅¬κ²½νκ³  μ₯λ°κ΅¬λμ μΉ λ΄μλ³΄μΈμ~!</h5>
	        	</c:if>
	        	<c:if test="${fn:length(list) != 0}">
		        	<button class="deleteall-btn" onclick="delAll('${currentUser.user_no}');">
		        		<h5>μ μ²΄ μ­μ </h5>
		        	</button>
		        	<div class="cart-list-container">
	        			<c:forEach var="vo" items="${list }" varStatus="status">
		        			<div class="cart-card-box">
										<div class="card cart-card">
											<c:if test="${vo.iisNew == true }"> 
												<h5 class="ing-name">${vo.ing_name }</h5>
											</c:if>
											<c:if test="${vo.iisNew == false }"> 
												<h5 style="margin: 0;">${vo.ing_name }</h5>
											</c:if>
										</div>
										<button class="item-delete" onclick="delBtn('${currentUser.user_no}', ${vo.ing_id });"><span></span></button>
									</div>
								</c:forEach>
							</div>
	        		<button class="ssag-pay-btn" onclick="ssag('${currentUser.user_no}', 1);">
	        		<h4>μΉ- λ΄μμ κ²°μ </h4>
	        		</button>
				</c:if>
        	</div>
		</div>
		<jsp:include page="../layout/menu.jsp" />
	</div>
	<div class="pc-bg-right"></div>
</div>
</body>
<script>
function goPage(pg, no, id) {
	if (pg == 1){
		//location.href="http://localhost:8081/ssgssag/refg.ssg?no=" + no;
		location.href="member/refg.ssg?no=" + no;
	} else if (pg == 2) {
		location.href="deleteCart.ssg?no=" + no + "&ing_id=" + id;
	}
}

function refg(id) {
	location.href="member/refg.ssg?no=" + id;
}

function ssag(id, onssg) {
	location.href="cart.ssg?no="+id+'&onssg=' + onssg;
}

function delBtn(no, id){
	console.log('μ¬λ£ μ­μ ');
	new swal({
		title : 'μ¬λ£ μ­μ ',
		text : 'λ΄ μ₯λ°κ΅¬λμμ μ­μ νμκ² μ΄μ?',
		icon : 'question',
		confirmButtonText: 'μ­μ ',
		cancelButtonText: 'μ·¨μ',
		showCancelButton: true
	}).then((result) =>{
		if(result.value) {
			location.href="deleteCart.ssg?no=" + no + "&ing_id=" + id;
		}
	});
}

function delAll(no) {
	new swal({
		title : 'λ€μ§μ~!!!~!',
		text : 'λ€ μ§μ΄λ€???? μ μ€ν μ νν΄',
		icon : 'question',
		confirmButtonText: 'μ­μ ',
		cancelButtonText: 'μ·¨μ',
		showCancelButton: true
	}).then((result) =>{
		if(result.value) {
			location.href="deleteCart.ssg?no=" + no + "&ing_id=-1";
		}
	});
}
</script>
<jsp:include page="/WEB-INF/views/layout/import_scripts.jsp"/>
</html>