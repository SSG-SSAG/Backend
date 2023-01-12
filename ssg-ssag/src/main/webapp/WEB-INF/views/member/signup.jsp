<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="/ssgssag/auth/signup" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td>
					<input class="id_input" type="text" name="id" placeholder="아이디를 입력해주세요">
					<span class="id_input_check1">사용 가능한 아이디입니다</span>
					<span class="id_input_check2">사용 중인 아이디입니다</span>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="nickname"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="2">여자</option>
					<input type="radio" name="gender" value="1">남자</option>
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="birth_date"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="회원가입">
				</td>
			</tr>
		</table>		
	</form>
</body>
<script>
	$('.id_input').on("propertychange change keyup paste input", function(){
		console.log("keyup 테스트");
	});
</script>
</html>