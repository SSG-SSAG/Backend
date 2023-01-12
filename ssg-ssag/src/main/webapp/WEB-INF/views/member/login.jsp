<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 페이지</h1>
	<form action="/ssgssag/auth/login" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="check_id" value="${memberVO.check_id}"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="check_password" value="${memberVO.check_password}"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인">
				</td>
			</tr>
		</table>		
	</form>
	
</body>
</html>