<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<meta charset="UTF-8">
<head>
	<jsp:include page="/WEB-INF/views/layout/import_head.jsp"/>
	<link rel="stylesheet" href="/ssgssag/resources/css/member.css?after">
</head>
<body>
	<div class="main-background">
    <div class="pc-bg-left"></div>
    <div class="main-container">
        <jsp:include page="../layout/header.jsp" />
        <div class="content-container">
            <h>${currentUser.name }의 냉장고!</h>
           	
			<table border="1">
				<tr>
					<td> 재료명</td>
					<td colspan="2"> 남은 기한</td>
					
				</tr>
				<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.ing_name }</td>
					<c:if test="${vo.over eq 'true' }"><td  style="background-color:#FF0000">
					유통기한지남
					</td></c:if>
					<c:if test="${vo.over eq 'false' }"><td  style="background-color:#008000">
					${vo.remain_day }일 ${vo.remain_hour } 시간
					</td></c:if>
					<td>
						<input type="button" value="삭제" onclick="del(${vo.refg_id});">
					</td>
				</tr>
				</c:forEach>
			</table>
			<input type="button" value="추가" onclick="show();">
			<div id="new" style="display:none">
				<form name="ingForm" action="refg_new.ssg" method="get">
					재료명<br>
					<input type="text" name="ing_name"><br>
					유통기한
					<input type="date" name="expire_date">	
					<input type="submit" value="add">
				</form>
			</div>
        </div>
        <jsp:include page="../layout/menu.jsp" />
	    </div>
	    <div class="pc-bg-right"></div>
	</div>
</body>
<script>
	function show() {
		var target = document.getElementById("new");
		if (target.style.display == "none") {
			target.style.display = "block";
		}
		else {
			target.style.display = "none";	
		}
	}

	function del(refg_id) {
		if (confirm('삭제하시겠습니까?')) {
			location.href="delete.ssg?refg_id="+refg_id;
		}
	}
</script>
<jsp:include page="/WEB-INF/views/layout/import_scripts.jsp"/>
</html>
