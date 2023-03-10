<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width">
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
            <div class="member-form">
			    <form action="/ssgssag/auth/signup.ssg" method="post">
					<div class="mb-3">
			            <label for="inputId" class="form-label">아이디</label>
			            <input type="text" class="form-control" name="id">
		          	</div>
					<div class="mb-3">
					  	<label for="inputPwd" class="form-label">비밀번호</label>
						<input type="password" class="form-control" name="password">
					</div>
			        <div class="mb-3">
			            <label for="inputName" class="form-label">이름</label>
			            <input type="text" class="form-control" name="name">
			        </div>
			        <div class="mb-3 rcenter-layout" style="justify-content: space-between;">
			            <!--  <div>
			                <input class="form-check-input" type="radio" name="gender" value="2">
			                <label class="form-check-label" for="gender">
			                    여자
			                </label>
			                <input class="form-check-input" type="radio" name="gender" value="1">
			                <label class="form-check-label" for="gender">
			                    남자
			                </label>				  		
			            </div>  -->
			            <div>
			                <label for="inputDate" class="form-label">생년월일</label>
			                <input type="date" name="birth_date">				  		
			            </div>
			        </div>
			        <div class="ccenter-layout">
			            <button type="submit" class="member-submit-btn">회원가입</button>
			        </div>
			    </form>
			    <div class="ccenter-layout">
			          <button class="member-submit-btn" onclick="location.href='/ssgssag/auth/login.ssg'">로그인으로 돌아가기</button>			  	
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