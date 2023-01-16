<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/layout/import_head.jsp"/>
	<link rel="stylesheet" href="/ssgssag/resources/css/member.css">
</head>
<body>
	<div class="main-background">
    <div class="pc-bg-left"></div>
    <div class="main-container">
        <jsp:include page="../layout/header.jsp" />
        <div class="content-container">
            <div class="member-hello">
			    SSG.COM 계정으로 쓱- 로그인해주세요
			</div>
			<div class="member-form">
			    <form action="/ssgssag/auth/login.ssg" method="post">
			    <div class="mb-3">
			        <label for="inputId" class="form-label">아이디</label>
			        <input type="text" class="form-control" name="id" value="${memberVO.id}">
			      </div>
			      <div class="mb-3">
			        <label for="inputPwd" class="form-label">비밀번호</label>
			        <input type="password" class="form-control" name="password" value="${memberVO.password}">
			      </div>
			      <div class="ccenter-layout">
			          <button type="submit" class="member-submit-btn">로그인</button>
			      </div>
			    </form>
			    <div class="ccenter-layout">
			          <button class="member-submit-btn" onclick="location.href='/ssgssag/auth/signup.ssg'">회원가입</button>			  	
			    </div>
			</div>
        </div>			
        <jsp:include page="../layout/menu.jsp" />
    </div>
    <div class="pc-bg-right"></div>
</div>
</body>
<script>
	function del(refg_id) {
		if (confirm('삭제하시겠습니까?')) {
			location.href="delete.ssg?refg_id="+refg_id;
		}
	}
</script>
<jsp:include page="/WEB-INF/views/layout/import_scripts.jsp"/>
</html>