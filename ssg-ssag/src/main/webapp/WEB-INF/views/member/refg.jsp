<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<meta charset="UTF-8">
<head>
	<title>REFG</title>
	<script>
	function del(refg_id) {
		if (confirm('삭제하시겠습니까?')) {
			location.href="delete.ssg?refg_id="+refg_id;
		}
	}
</script>
</head>
<body>
<h>나의 냉장고!</h>
<hr>


<table border="1">
	<tr>
		<td> 재료 명</td>
		<td colspan="2"> 남은 기한</td>
		
	</tr>
	<c:forEach var="vo" items="${list }">
	<tr>
		<td>${vo.ing_name }</td>
		<td>${vo.remain_day }일 ${vo.remain_hour } 시간</td>
		<c:if test="${vo.over eq 'true' }">
		<td>
			<input type="button" value="삭제" onclick="del(${vo.refg_id});">
		</td>
		</c:if>		
	</tr>
	
	</c:forEach>
</table>


</body>
</html>
