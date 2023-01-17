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
						<input id="delBtn" type="button" value="삭제">
						<%-- <input type="button" value="삭제" onclick="del(${vo.refg_id});"> --%>
					</td>
					<form id="myingForm" name="myingForm" action="delete.ssg" method="get">
						<input type="hidden" name="refg_id" value="${vo.refg_id }">
					</form>
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
					<input id="addBtn" type="button" value="추가">
					<!-- <input type="submit" value="추가"> -->
				</form>
			</div>
        </div>
        <jsp:include page="../layout/menu.jsp" />
	    </div>
	    <div class="pc-bg-right"></div>
	</div>
</body>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
	
	$(document).ready(function (){
		
		$("#addBtn").on("click", function(){
			console.log('재료 추가');
			new swal({
				title : '재료 추가',
				text : '내 냉장고에 추가하시겠어요?',
				icon : 'question',
				confirmButtonText: '추가',
				cancelButtonText: '취소',
				showCancelButton: true
			}).then((result) => {
				if(result.value) {
					ingForm.submit();
				}
			});
		});
		
		$("#delBtn").on("click", function(){
			console.log('재료 삭제');
			new swal({
				title : '재료 삭제',
				text : '내 냉장고에서 삭제하시겠어요?',
				icon : 'question',
				confirmButtonText: '삭제',
				cancelButtonText: '취소',
				showCancelButton: true
			}).then((result) =>{
				if(result.value) {
					$("#myingForm").submit();
				}
			});
		});
	});
</script>
<jsp:include page="/WEB-INF/views/layout/import_scripts.jsp"/>
</html>
