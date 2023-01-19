<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<meta name="viewport" content="width=device-width">
<head>
	<jsp:include page="/WEB-INF/views/layout/import_head.jsp"/>
	<link rel="stylesheet" href="/ssgssag/resources/css/mypage.css">
	<link rel="stylesheet" href="/ssgssag/resources/css/member.css?after">
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
			         <h2>관심 태그 추가</h2>
			         <h5>관심 태그 설정 후 추천 레시피 보러 가기</h5>
			         <form id="tagForm" name="tagForm" action="tag_new.ssg" method="get">
						<select id="catBox" name="catBox" onchange="boxSelect(this)">
							<option value="cat">관심 카테고리를 선택하세요!</option>
							<option value="option">종류</option>
							<option value="health">건강</option>
							<option value="theme">테마</option>
							<option value="cook">조리법</option>
						</select>
						<select id="tagBox" name="tag_name">
							<option>관심 있는 #태그를 선택해주세요</option>
						</select>
						<input type="hidden" name="user_no" value="${currentUser.user_no }">
					</form>
			     </div>
			     <!--팝업 버튼 영역-->
			     <div class="popup_btn" style="float: bottom; margin-top: 200px;">
			          <a href="javascript:addBtn();">추가</a>
			          <!-- <button onclick="addBtn()"></button> -->
			          <a href="javascript:closePop();">닫기</a>
			     </div>
			  </div>
			</div>
        	<div class="tag-list-container">
				<h3>${currentUser.name }님이 관심 있는 태그예요</h3>
				<div style="display: inline-block">
					<c:forEach var="vo" items="${list_tags }" varStatus="status">
						<div class="card tag-card" onclick="goPage(2, ${vo.tag_id}, '${vo.tag_name}', ${vo.category_id }, '${vo.category_name}');" style="display: inline-block; margin-left:20px;">
							<c:if test="${vo.category_name eq '종류'}">
								<h4 style="margin: 0; color:#FF8C00;">${vo.category_name }</h4>
							</c:if>
							<c:if test="${vo.category_name eq '건강'}">
								<h4 style="margin: 0; color:#2E8B57;">${vo.category_name }</h4>
							</c:if>
							<c:if test="${vo.category_name eq '테마'}">
								<h4 style="margin: 0; color:#DB7093;">${vo.category_name }</h4>
							</c:if>
							<c:if test="${vo.category_name eq '조리법'}">
								<h4 style="margin: 0; color:#F0E68C;">${vo.category_name }</h4>
							</c:if>
							<h5>#${vo.tag_name }</h5>
						</div>
						<button class="mytagdelete" style="vertical-align:top; display: inline-block; height:80px;" onclick="delBtn(${vo.like_tag_id });"><span></span></button>
						<%-- <input style="vertical-align:top; display: inline-block; height:80px" class="mytagdelete" id="delBtn${vo.like_tag_id }" type="button" value="삭제" onclick="delBtn(${vo.like_tag_id });"> --%>
					</c:forEach>
				</div>
				<input type="button" style="background-color:red; border:0px; width:100px; border-radius:15px;" value="태그추가" onclick="openPop();">
				<div id="addTag" style="display:none">
					<form name="tagForm" action="tag_new.ssg" method="get">
						<select id="catBox" name="catBox" onchange="boxSelect(this)">
							<option value="cat">관심 카테고리를 선택하세요!</option>
							<option value="option">종류</option>
							<option value="health">건강</option>
							<option value="theme">테마</option>
							<option value="cook">조리법</option>
						</select>
						<select id="tagBox" name="tag_name">
							<option>관심 있는 #태그를 선택해주세요</option>
						</select>
						<input id="addBtn" type="button" value="추가">
						<input type="hidden" name="user_no" value="${currentUser.user_no }">
					</form>
				</div>
        	</div>
        	<div style="align-items: center;">
				<h3>회원 정보 수정</h3>	
				<input type="button" value="회원 정보 수정" onclick="goPage(4, ${currentUser.user_no});">
        	</div>
		</div>
		<jsp:include page="../layout/menu.jsp" />
	    </div>
	<div class="pc-bg-right"></div>
</div>
</body>
<jsp:include page="/WEB-INF/views/layout/import_scripts.jsp"/>
</html>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>

function goPage(pg, id, name, cat, cname) {
	if (pg == 1) {
		location.href = "../";
	} else if (pg == 2) {	// 다음 페이지로 이동
		location.href = "../recipe/recipe_tag.ssg?tag_id=" + id + "&tag_name=" + name + "&cat=" + cat + "&category_name=" + cname;
	} else if (pg == 3) {
		//deleteTag();
		location.href="deleteTag.ssg?like_tag_id="+id;
	} else if (pg == 4) {
		location.href="change.ssg?user_no="+id;
	} else if (pg == 5) {
		location.href="../recipe/cart.ssg?no="+id;
	}
}

function openPop(){
	document.getElementById("popup_layer").style.display = "block";
}

function closePop(){
	document.getElementById("popup_layer").style.display = "none";
}

function boxSelect(cat){
	var option = ["밥", "반찬", "찌개/국", "디저트", "한그릇"];
	var health = ["저탄고지", "저열량", "저염식", "고단백", "안매운"];
	var theme = ["안주요리", "파티요리", "이색요리", "여름별미", "겨울별미"];
	var cook = ["끓이기", "튀기기", "찌기", "굽기", "볶기", "기타"];
	var target = document.getElementById("tagBox");

	if(cat.value == "option") {
		var tag = option;
	} else if(cat.value == "health") {
		var tag = health;
	} else if(cat.value == "theme") {
		var tag = theme;
	} else if(cat.value == "cook") {
		var tag = cook;
	}

	target.options.length = 0;

	for (x in tag) {
		var opt = document.createElement("option");
		opt.value = tag[x];
		opt.innerHTML = tag[x];
		target.appendChild(opt);
	}
}

function addBtn(){
	console.log('팝업');
	document.getElementById("popup_layer").style.display = "none";
	new swal({
		title : '관심 태그 추가',
		text : '관심 태그에 추가하시겠어요?',
		icon : 'question',
		confirmButtonText: '추가',
		cancelButtonText: '취소',
		showCancelButton: true
	}).then((result) => {
		if(result.value) {
			const form = document.getElementById('tagForm');
			form.submit();
		}
	});
}

function delBtn(id){
	console.log('태그 삭제');
	new swal({
		title : '관심 태그 삭제',
		text : '관심 태그에서 삭제하시겠어요?',
		icon : 'question',
		confirmButtonText: '삭제',
		cancelButtonText: '취소',
		showCancelButton: true
	}).then((result) =>{
		if(result.value) {
			location.href="deleteTag.ssg?like_tag_id="+id;
		}
	});
}

$(document).ready(function (){
	
	/* $("#addBtn").on("click", function(){
		console.log('팝업');
		document.getElementById("popup_layer").style.display = "none";
		new swal({
			title : '관심 태그 추가',
			text : '관심 태그에 추가하시겠어요?',
			icon : 'question',
			confirmButtonText: '추가',
			cancelButtonText: '취소',
			showCancelButton: true
		}).then((result) => {
			if(result.value) {
				const form = document.getElementById('tagForm');
				form.submit();
			}
		});
	}); */
});

</script>
