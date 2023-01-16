<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" /> -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
/* function addTag(){
	new swal("Alert", "hi");
}

function deleteTag(){
	new swal("삭제", "관심 태그를 삭제할까요?");
} */
	/* var alert = function(msg, type) {
		swal('로그인 실패!',"아이디와 비밀번호를 확인해 주세요",'warning');
		swal({
			title : '',
			text : msg,
			type : type,
			timer : 1500,
			customClass : 'sweet-size',
			showConfirmButton : false
		});
		swal('로그인 성공!','success')
		.then(function(){
			location.href="mypage.ssg";                   
		})

		} else {
			swal('로그인 실패!',"아이디와 비밀번호를 확인해 주세요",'warning');
		};
	} */

	/* var confirm = function(msg, title, resvNum) {
		swal({
			title : title,
			text : msg,
			type : "warning",
			showCancelButton : true,
			confirmButtonClass : "btn-danger",
			confirmButtonText : "예",
			cancelButtonText : "아니오",
			closeOnConfirm : false,
			closeOnCancel : true
		}, function(isConfirm) {
			if (isConfirm) {
				swal('', '예약이 승인되었습니다.', "success");
			}else{
				swal('', '예약이 거부되었습니다.', "failed");
			}

		});
		swal('로그인 성공!','success')
		.then(function(){
			location.href="mypage.ssg";                   
		})

		} else {
			swal('로그인 실패!',"아이디와 비밀번호를 확인해 주세요",'warning');
		};
	}

	function Alert() {
		alert('gg', 'success');
	}
	function Confirm() {
		confirm('', '승인할까요?');
	} */
</script>

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

function showTag(){
	var target = document.getElementById("addTag");
	if (target.style.display == "none") {
		target.style.display = "block";
	}
	else {
		target.style.display = "none";	
	}
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

function addTag(id){
	//new swal("Alert", "hi");
	new swal("관심 태그 추가", "관심 태그에 추가하시겠어요?", 'question').then(
		function(){
			location.href="mypage.ssg?user_no="+id;
		}
	)
}

function deleteTag(){
	new swal("삭제", "관심 태그를 삭제할까요?");
}

</script>

<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/import_head.jsp"/>
	<link rel="stylesheet" href="/ssgssag/resources/css/recipe.css">
	<link rel="stylesheet" href="/ssgssag/resources/css/member.css?after">
</head>
<body>
<div class="main-background">
    <div class="pc-bg-left"></div>
    <div class="main-container">
        <jsp:include page="../layout/header.jsp" />
	    <div class="content-container">
        	<div>
        		<!-- <button onclick="Alert();">Alert</button>
				<button onclick="Confirm();">Confirm</button> -->
				<h3>회원 정보 수정</h3>	
				<input type="button" value="회원 정보 수정" onclick="goPage(4, ${currentUser.user_no});">
        	</div>
        	<div>        	
				<h3>장바구니</h3>	
				<input type="button" value="장바구니" onclick="goPage(5, ${currentUser.user_no});">
        	</div>
        	<div>
			<table border="1">
				<h3>${currentUser.name }님이 관심 있는 태그예요</h3>	
				<tr>
					<td></td>
					<td>카테고리</td>
					<td>#관심태그</td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="vo" items="${list_tags }" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${vo.category_name }</td>
					<td>${vo.tag_name }</td>
					<td><button onclick="goPage(2, ${vo.tag_id}, '${vo.tag_name}', ${vo.category_id }, '${vo.category_name}')">레시피 보러가기</button></td>
					<td><button onclick="goPage(3, ${vo.like_tag_id})">삭제</button></td>
				</tr>
				</c:forEach>
			</table>

			<input type="button" value="태그추가" onclick="showTag();">
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
					<input type="submit" value="추가" onclick="addTag(${currentUser.user_no });">
					<input type="hidden" name="user_no" value="${currentUser.user_no }">
				</form>
			</div>
        	</div>
		</div>
		<jsp:include page="../layout/menu.jsp" />
	    </div>
	<div class="pc-bg-right"></div>
</div>
</body>
<jsp:include page="/WEB-INF/views/layout/import_scripts.jsp"/>
</html>
