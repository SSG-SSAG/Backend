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
        <div class="content-container">
        	<h2>${currentUser.name }님의 장바구니</h2>
        	<input type="button" value="모두사라져" onclick="delAll('${currentUser.user_no}');">
			<table border="1">
				<tr>
					<td>재고</td>
					<td>update_date</td>
					<td></td>
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr>
						<c:if test="${vo.iisNew == true }"> 
							<td style="background-color:#FF0000">${vo.ing_name}</td>
							<td>${vo.update_date}</td>
						</c:if>
						<c:if test="${vo.iisNew eq 'false' }"> 
							<td >${vo.ing_name}</td>
							<td>${vo.update_date}</td>
						</c:if>
						<td><input id="delBtn${vo.ing_id }" type="button" value="삭제" onclick="delBtn('${currentUser.user_no}', ${vo.ing_id });"></td>
					</tr>
				</c:forEach>
			</table>
      <input type="button" value="싹~~~~~~" onclick="ssag('${currentUser.user_no}', 1);">
			<input type="button" value="냉장고로 이동" onclick="goPage(1, '${currentUser.user_no}');">
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