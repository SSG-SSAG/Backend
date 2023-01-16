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
<td >${vo.ing_name}</td>
			<td>${vo.update_date}</td>
		</c:if>
	</tr>
	</c:forEach>
</table>
<input type="button" value="싹~~~~~~" onclick="ssag('${currentUser.user_no}', 1);">
<input type="button" value="냉장고로 이동" onclick="refg('${currentUser.user_no}');">
<div class="main-background">
    <div class="pc-bg-left"></div>
    <div class="main-container">
        <jsp:include page="../layout/header.jsp" />
        <div class="content-container">
        	<h2>${currentUser.name }님의 장바구니</h2>
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
						<td><button onclick="goPage(2, '${currentUser.user_no}', ${vo.ing_id});">삭제</button></td>
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
			location.href="http://localhost:8081/ssgssag/refg.ssg?no=" + no;
		} else if (pg == 2) {
			location.href="deleteCart.ssg?no=" + no + "&ing_id=" + id;
		}
	}
  
  function refg(id) {
	 location.href="http://localhost:8081/ssgssag/refg.ssg?no=" + id;	 
	 
 }
 
 function ssag(id, onssg) {
	location.href="http://localhost:8081/ssgssag/recipe/cart.ssg?no="+id+'&onssg=' + onssg;
 }
</script>
<jsp:include page="/WEB-INF/views/layout/import_scripts.jsp"/>
</html>