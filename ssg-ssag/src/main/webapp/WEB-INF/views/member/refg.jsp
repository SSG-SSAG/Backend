<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			     		<div class="popup_cont" style="text-align:center;">
			        		<h3>🥕🥦 재료 추가 🍚🥩</h3>
			        		<h5>내 냉장고에 있는 재료를 추가해보세요!</h5>
			        		<div id="new">
								<form name="ingForm" action="refg_new.ssg" method="get">
									재료명<br>
									<input type="text" name="ing_name"><br>
									유통기한<br>
									<input type="date" name="expire_date">
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
				<div class="rfg-list-container ccenter-layout">
	        		<h3>🍴${currentUser.name }님의 냉장고🍴</h3>
		            <c:if test="${fn:length(list) == 0}">
			        	<h5 style="color:#FFB6C1;">아직 냉장고에 아무 것도 없네요 😥</h5>
			        	<h5>집에 있는 재료와 유통기한을 추가해보세요!</h5>
			        </c:if>
           			<c:if test="${fn:length(list) != 0}">
	        			<h6>냉장고에 있는 재료로 레시피 검색해서 요리하는건 어떠세요? 😋</h6>
	        			<div class="rfg-box-container">
	        				<c:forEach var="vo" items="${list }" varStatus="status">
										<div class="card rfg-card" style="display: inline-block; width:150px; margin-left:5px;">
									<h4 style="margin: 0;">${vo.ing_name }</h4>
									<c:if test="${vo.over eq 'true' }">
										<h5 style="background-color:#FFB6C1">유통기한지남</h5>
									</c:if>
									<c:if test="${vo.over eq 'false' }">
										<h5 style="background-color:#90EE90">${vo.remain_day }일 ${vo.remain_hour }시간</h5>
									</c:if>
								</div>
								<button class="mytagdelete" style="vertical-align:top; display: inline-block; height:80px;" onclick="delBtn(${vo.refg_id})"><span></span></button>
						<%-- <input style="margin-left:auto;" type="button" value="삭제" onclick="delBtn(${vo.refg_id });"> --%>
							</c:forEach>
						</div>
					</c:if>
					<button id="openBtn" onclick="openPop();" style="align-items: center;" class="cart-add-btn">
						<h4>추가</h4>
					</button>
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
