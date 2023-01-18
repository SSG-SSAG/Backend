<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<head>
	<jsp:include page="/WEB-INF/views/layout/import_head.jsp"/>
	<link rel="stylesheet" href="/ssgssag/resources/css/member.css?after">
	<link rel="stylesheet" href="/ssgssag/resources/css/refg.css?after">
</head>
<body>
	<div class="main-background">
    <div class="pc-bg-left"></div>
    <div class="main-container">
        <jsp:include page="../layout/header.jsp" />
        <div class="content-container">
        	<h3>${currentUser.name }의 냉장고!</h3>
        	<div class="ref-list-container">
        		<c:forEach var="vo" items="${list }" varStatus="status">
					<div class="card step-card" style="display: flex; flex-direction: row;">
						<div class="step-card-body">
							<p class="step-desc-p">${vo.ing_name }</p>
							<c:if test="${vo.over eq 'true' }">
							<p class="step-desc-p" style="background-color:#FF0000">유통기한지남</p>
							</c:if>
							<c:if test="${vo.over eq 'false' }">
							<p class="step-desc-p" style="background-color:#008000">${vo.remain_day }일 ${vo.remain_hour }시간</p>
							</c:if>
							<p class="step-desc-p">
							<input id="delBtn${vo.refg_id }" type="button" value="삭제" onclick="delBtn(${vo.refg_id });">		    									
							</p>
						</div>
					</div>
				</c:forEach>
				
				<%-- <table border="1">
					<tr>
						<td>재료명</td>
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
							<input id="delBtn${vo.refg_id }" type="button" value="삭제" onclick="delBtn(${vo.refg_id });">
						</td>
					</tr>
					</c:forEach>
				</table> --%>
				<input type="button" value="추가" onclick="show();">
				<div id="new" style="display:none">
					<form name="ingForm" action="refg_new.ssg" method="get">
						재료명<br>
						<input type="text" name="ing_name"><br>
						유통기한
						<input type="date" name="expire_date">
						<input id="addBtn" type="button" value="추가">
					</form>
				</div>
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
	
	function delBtn(id){
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
				location.href="delete.ssg?refg_id="+id;
			}
		});
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
	});
</script>
<jsp:include page="/WEB-INF/views/layout/import_scripts.jsp"/>
</html>
