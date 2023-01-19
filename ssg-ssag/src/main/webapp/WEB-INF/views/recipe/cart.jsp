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
        	<div class="cart-list-container">
	        	<h3>🛒${currentUser.name }님의 장바구니🛒</h3>
	        	<c:if test="${fn:length(list) == 0}">
	        		<h5 style="color:#FFB6C1;">아직 장바구니에 아무 것도 없네요 😥</h5>
	        		<h5>레시피 구경하고 장바구니에 싹 담아보세요~!</h5>
	        	</c:if>
	        	<c:if test="${fn:length(list) != 0}">
		        	<input type="button" value="모두사라져" onclick="delAll('${currentUser.user_no}');">
		        	<div style="display: inline-block;">
	        		<c:forEach var="vo" items="${list }" varStatus="status">
						<div class="card cart-card" style="display: inline-block; margin-left:5px; width:150px;">
							<c:if test="${vo.iisNew == true }"> 
								<h5 style="margin: 0; background-color:#FFB6C1;">${vo.ing_name }</h5>
								<h7 style="margin: 0;">${vo.update_date}</h7>
							</c:if>
							<c:if test="${vo.iisNew == false }"> 
								<h5 style="margin: 0;">${vo.ing_name }</h5>
								<h7 style="margin: 0;">${vo.update_date}</h7>
							</c:if>
							
						</div>
						<button class="mytagdelete" style="vertical-align:top; display: inline-block; height:80px;" onclick="delBtn('${currentUser.user_no}', ${vo.ing_id });"><span></span></button>
						<%-- <input style="margin-left:auto;" id="delBtn${vo.ing_id }" type="button" value="삭제" onclick="delBtn('${currentUser.user_no}', ${vo.ing_id });"> --%>
					</c:forEach>
					</div>
	        		<input type="button" value="싹~~~~~~" onclick="ssag('${currentUser.user_no}', 1);">
	        		<input type="button" value="냉장고로 이동" onclick="goPage(1, '${currentUser.user_no}');">
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
	console.log('재료 삭제');
	new swal({
		title : '재료 삭제',
		text : '내 장바구니에서 삭제하시겠어요?',
		icon : 'question',
		confirmButtonText: '삭제',
		cancelButtonText: '취소',
		showCancelButton: true
	}).then((result) =>{
		if(result.value) {
			location.href="deleteCart.ssg?no=" + no + "&ing_id=" + id;
		}
	});
}

function delAll(no) {
	new swal({
		title : '다지워~!!!~!',
		text : '다 지운다???? 신중히 선택해',
		icon : 'question',
		confirmButtonText: '삭제',
		cancelButtonText: '취소',
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