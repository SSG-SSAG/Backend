<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<head>
	<jsp:include page="/WEB-INF/views/layout/import_head.jsp"/>
	<link rel="stylesheet" href="/ssgssag/resources/css/member.css?after">
	<link rel="stylesheet" href="/ssgssag/resources/css/refg.css">
	<link rel="stylesheet" href="/ssgssag/resources/css/popup.css?after">
</head>
<body>
	<div class="main-background">
    <div class="pc-bg-left"></div>
    <div class="main-container">
        <jsp:include page="../layout/header.jsp" />
        <div class="content-container">
        	<!-- pop up layer -->
	    	<div class="popup_layer" id="popup_layer" style="display: none;">
			 <div class="popup_box">
			     <div style="height: 10px; width: 375px; float: top;">
			       <a href="javascript:closePop();"><class="m_header-banner-close" width="30px" height="30px"></a>
			     </div>
			     <!--팝업 컨텐츠 영역-->
			     <div class="popup_cont">
			        <h2>재료 추가</h2>
			        <h5>내 냉장고에 재료 추가하기~!</h5>
			        <div id="new">
						<form name="ingForm" action="refg_new.ssg" method="get">
							재료명<br>
							<input type="text" name="ing_name"><br>
							유통기한
							<input type="date" name="expire_date">
							<input type="button" value="추가" onclick="addBtn();">
						</form>
					</div>
			     </div>
			     <!--팝업 버튼 영역-->
			     <div class="popup_btn" style="float: bottom; margin-top: 200px;">
			          <a href="javascript:addBtn();">추가</a>
			          <a href="javascript:closePop();">닫기</a>
			     </div>
			  </div>
			</div>
			<div class="rfg-list-container">
	        	<h3>${currentUser.name }님의 냉장고!</h3>
	        	<!-- <div class="ref-list-container"> -->
        		<c:forEach var="vo" items="${list }" varStatus="status">
					<div class="card rfg-card" style="display: flex; flex-direction: row;">
						<h4 style="margin: 0;">${vo.ing_name }</h4>
						<c:if test="${vo.over eq 'true' }">
							<h5 style="background-color:#FFB6C1">유통기한지남</h5>
						</c:if>
						<c:if test="${vo.over eq 'false' }">
							<h5 style="background-color:#90EE90">${vo.remain_day }일 ${vo.remain_hour }시간</h5>
						</c:if>
						<input id="delBtn${vo.refg_id }" type="button" value="삭제" onclick="delBtn(${vo.refg_id });">
					</div>
				</c:forEach>
				<input id="openBtn" type="button" value="추가" onclick="openPop();" style="align-items: center;">
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
	
	function openPop(){
		document.getElementById("popup_layer").style.display = "block";
	}

	function closePop(){
		document.getElementById("popup_layer").style.display = "none";
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
	
	function addBtn(){
		document.getElementById("popup_layer").style.display = "none";
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
	}
	
	$(document).ready(function (){
		/* document.getElementById("popup_layer").style.display = "none";
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
		}); */
	});
</script>
<jsp:include page="/WEB-INF/views/layout/import_scripts.jsp"/>
</html>
